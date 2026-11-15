# Run with: bundle exec ruby scripts/check_blogs.rb
require 'jekyll'
require 'json'
require 'time'

# Render as production so the Content-Security-Policy is checked too.
ENV['JEKYLL_ENV'] = 'production'
CARD_LINK = /<h3 class="card-title"><a href="([^"]+)"/

site = Jekyll::Site.new(Jekyll.configuration('quiet' => true, 'future' => true))
site.reset
site.read
site.generate
site.render

pages = site.pages.select(&:pager).sort_by { |page| page.pager.page }
meetups = site.posts.docs.reverse.reject { |post| post.data['categories'].include?('community') || post.data['hidden'] }
rendered_urls = []
pages.each_with_index do |page, index|
  pane = page.output.split('id="area-meetup"', 2).last.split('id="area-community"', 2).first
  urls = pane.scan(CARD_LINK).flatten
  expected = meetups.slice(index * site.config['paginate'], site.config['paginate'])
  raise "Wrong meetup cards on #{page.url}" unless urls == expected.map(&:url)
  if index.positive?
    raise "Page 1 link is incorrect on #{page.url}" unless pane.match?(%r{href="/">1</a>})
  end
  rendered_urls.concat(urls)
end
raise 'Meetup posts are missing or duplicated' unless rendered_urls.size == meetups.size && rendered_urls.uniq == rendered_urls

community = site.posts.docs.reverse.select { |post| post.data['categories'].include?('community') }
blog = site.pages.find { |page| page.url == '/community-blog/' }.output
card_urls = blog.scan(CARD_LINK).flatten
raise 'Community cards are missing or out of order' unless card_urls == community.map(&:url)
home_community = pages.first.output.split('id="area-community"', 2).last.split('</section>', 2).first.scan(CARD_LINK).flatten
raise 'Homepage community posts are missing' unless home_community == community.first(3).map(&:url)

# Paper-n-PiP: every episode is complete, and the homepage shows the newest three.
paper = site.data['paper_n_pip']
raise 'Paper-n-PiP playlist link is missing' unless paper['playlist'].to_s.start_with?('https://www.youtube.com/playlist?list=')
paper['episodes'].each do |episode|
  missing = %w[title speaker date video].reject { |key| episode[key].to_s.strip != '' }
  raise "Paper-n-PiP episode #{episode['title'].inspect} is missing #{missing.join(', ')}" unless missing.empty?
  raise "Paper-n-PiP video id looks wrong: #{episode['video']}" unless episode['video'].to_s.match?(/\A[\w-]{11}\z/)
end
paper_section = pages.first.output.split('id="paper-n-pip"', 2).last.split('</section>', 2).first
raise 'Paper-n-PiP section does not say how to submit a session' unless paper_section.include?('href="https://github.com/bangpypers/meetup-talks"')
home_paper = paper_section.scan(CARD_LINK).flatten
expected_videos = paper['episodes'].first(3).map { |episode| episode['video'] }
raise 'Homepage Paper-n-PiP episodes are wrong' unless home_paper.map { |url| url[/watch\?v=([\w-]+)/, 1] } == expected_videos

# The how-BangPypers-is-run post has its own callout on the homepage, not only
# a footer link and an archive entry.
how_run = site.posts.docs.find { |post| post.basename.include?('how-bangpypers-is-run') }
callout = pages.first.output.split('class="callout"', 2)[1].to_s.split('</div>', 3).first(2).join
raise 'How BangPypers is run is missing from the homepage callout' unless callout.include?(%(href="#{how_run.url}"))

# Readers must know meetups are free even when Meetup.com shows a payment step.
raise 'The homepage no longer says how to RSVP without paying' unless pages.first.output.include?('Continue without paying')

# Embeds in posts need a title for screen readers, and must load lazily.
site.posts.docs.each do |post|
  post.output.scan(/<iframe\b[^>]*>/i).each do |tag|
    raise "Embed without a title in #{post.relative_path}" unless tag.match?(/\stitle="[^"]+"/)
    raise "Embed is not lazy-loaded in #{post.relative_path}" unless tag.include?('loading="lazy"')
  end
end
raise 'Contribution link is missing' unless blog.include?('Write a community post')
raise 'Guide Markdown is broken' unless community.find { |post| post.basename.include?('welcome-to-the-community-blog') }.output.include?('<h4 id="4-write-your-content">')

site.posts.docs.each do |post|
  count = post.output.scan('src="https://giscus.app/client.js"').size
  expected = post.data['comments'] == false ? 0 : 1
  raise "Wrong comment embed count for #{post.url}" unless count == expected
end
raise 'Comments loaded on the blog index' if blog.include?('giscus.app/client.js')

comments = Liquid::Template.parse(File.read('_includes/giscus.html'))
render_comments = lambda do |config, page|
  comments.render!({ 'site' => { 'giscus' => config }, 'page' => page }, registers: { site: site })
end
config = site.config['giscus']
raise 'Comment opt-out failed' unless render_comments.call(config, { 'comments' => false }).strip.empty?
[nil, {}, config.merge('repo_id' => ''), config.merge('category_id' => '')].each do |incomplete|
  raise 'Incomplete Giscus configuration rendered a widget' unless render_comments.call(incomplete, {}).strip.empty?
end
raise 'Comments are not mapped by pathname' unless render_comments.call(config, {}).include?('data-mapping="pathname"')
# Security: templates must not need 'unsafe-inline' scripts, and the policy must ship.
templates = Dir['_layouts/*.html', '_includes/*.html', '*.html']
templates.each do |file|
  source = File.read(file)
  raise "Inline event handler in #{file}" if source.match?(/\son[a-z]+\s*=/i)
  inline = source.scan(/<script\b[^>]*>/i).reject do |tag|
    tag.include?('src=') || tag.include?('application/ld+json') || tag.include?('type="speculationrules"')
  end
  raise "Inline script in #{file}" unless inline.empty?
end
home = pages.first.output
raise 'Content-Security-Policy is missing' unless home.include?('http-equiv="Content-Security-Policy"')
rules = home[%r{<script type="speculationrules">(.*?)</script>}m, 1]
raise 'Speculation rules are missing' unless rules
JSON.parse(rules)
policy = home[/http-equiv="Content-Security-Policy" content="([^"]+)"/, 1]
raise "The policy must allow 'inline-speculation-rules'" unless policy.include?("'inline-speculation-rules'")
raise "The policy must not allow 'unsafe-inline' scripts" if policy[/script-src[^;]*/].include?("'unsafe-inline'")
raise 'Policy must come before the first script' unless home.index('Content-Security-Policy') < home.index('<script')
# A saved theme must apply before the first paint, or dark-mode readers see a white flash.
theme_script = home[%r{<script src="[^"]*/theme\.js"[^>]*>}]
raise 'theme.js must load without defer or async' unless theme_script && !theme_script.match?(/\b(defer|async)\b/)
raise 'theme.js must load before the stylesheet' unless home.index(theme_script) < home.index('main.css')

search = JSON.parse(site.pages.find { |page| page.url == '/search.json' }.output)
raise 'Search index is incomplete' unless search.size == site.posts.docs.size
raise 'Search index has an unsafe URL' unless search.all? { |doc| doc['url'].start_with?('/') }

post_html = site.posts.docs.last.output
[home, post_html].each do |html|
  html.scan(%r{<script type="application/ld\+json">(.*?)</script>}m).flatten.each { |json| JSON.parse(json) }
end
# A "</script>" in a title, description or author name must not end the JSON-LD block early.
hostile = '</script><img src=x onerror=alert(1)>'
structured = Liquid::Template.parse(File.read('_includes/structuredata.html')).render!(
  {
    'site' => site.config.merge('name' => hostile, 'data' => site.data,
                                'authors' => [{ 'username' => 'x', 'name' => hostile, 'url' => '/authors/x/' }]),
    'page' => { 'layout' => 'post', 'title' => hostile, 'url' => '/x/', 'date' => Time.now, 'authors' => ['x'] },
    'page_description' => hostile,
    'page_image' => 'https://example.com/cover.png'
  },
  registers: { site: site }
)
raise 'Structured data can end its script element early' unless structured.scan(%r{</script}i).size == 1
data = JSON.parse(structured[%r{<script type="application/ld\+json">(.*)</script>}m, 1])
escaped = [data['headline'], data['description'], data['author'][0]['name'], data['publisher']['name']]
raise 'Structured data changed the escaped text' unless escaped.all?(hostile)

security_txt = site.static_files.find { |file| file.relative_path == '/.well-known/security.txt' }
raise 'security.txt is not published' unless security_txt
expires = Time.parse(File.read(security_txt.path)[/^Expires: (.+)$/, 1])
raise 'security.txt has expired; update its Expires date' unless expires > Time.now

puts "PASS: #{pages.size} meetup pages, #{community.size} community posts, Giscus, CSP, search index and security.txt checks"
