# Run with: bundle exec ruby scripts/check_blogs.rb
require 'jekyll'

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
  urls = pane.scan(/<h2 class="card-title"><a[^>]+href="([^"]+)"/).flatten
  expected = meetups.slice(index * site.config['paginate'], site.config['paginate'])
  raise "Wrong meetup cards on #{page.url}" unless urls == expected.map { |post| site.config['url'] + post.url }
  if index.positive?
    raise "Page 1 link is incorrect on #{page.url}" unless pane.match?(%r{href="/">1</a>})
  end
  rendered_urls.concat(urls)
end
raise 'Meetup posts are missing or duplicated' unless rendered_urls.size == meetups.size && rendered_urls.uniq == rendered_urls

community = site.posts.docs.reverse.select { |post| post.data['categories'].include?('community') }
blog = site.pages.find { |page| page.url == '/community-blog/' }.output
card_urls = blog.scan(/<h2 class="card-title"><a[^>]+href="([^"]+)"/).flatten
raise 'Community cards are missing or out of order' unless card_urls == community.map { |post| site.config['url'] + post.url }
home_community = pages.first.output.split('id="area-community"', 2).last
raise 'Homepage community posts are missing' unless community.all? { |post| home_community.include?(site.config['url'] + post.url) }
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
puts "PASS: #{pages.size} meetup pages, #{community.size} community posts, Giscus embeds and opt-out/configuration checks"
