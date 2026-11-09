# BangPypers

Source code for Bangalore Python User Group Blog. Read blog at  https://bangalore.pythonindia.org

## Setup Locally:

You need Ruby 3.2 or newer. Install the gems inside the project, so you don't
need write access to the system gem directory:

```sh
bundle config set --local path vendor/bundle
bundle install
```

## Run:

```sh
bundle exec jekyll serve
```

You can use `--livereload` to keep auto-updating changes.

To preview the production build (Content-Security-Policy and analytics on):

```sh
JEKYLL_ENV=production bundle exec jekyll build
```

## Blog checks

```sh
bundle exec ruby scripts/check_blogs.rb
```

This renders the site and checks meetup pagination, community article cards,
and the Giscus embed, including posts that opt out of comments. It also checks
that templates have no inline scripts or event handlers, that the
Content-Security-Policy is present, that the search index is complete and
that `.well-known/security.txt` has not expired. The same checks run on every
pull request.

## Deployment

`.github/workflows/pages.yml` builds the site with the gems in `Gemfile.lock`
and deploys it to GitHub Pages on every push to `master`. Repository settings
must have Pages > Build and deployment > Source set to **GitHub Actions**; the
default Pages builder skips `jekyll-archives`, so tag and year pages would 404.

## Security

- The Content-Security-Policy is in `_includes/head.html`. Templates must not
  use inline `<script>` blocks or `on*=` attributes; put code in
  `assets/js/`. When a post needs a new embed (an iframe from a new site),
  add that host to `frame-src` rather than loosening the policy.
- Third-party scripts in post Markdown (old Twitter and Speaker Deck embeds)
  are blocked by the policy; the posts link to the original instead.
- Report vulnerabilities as described in [SECURITY.md](SECURITY.md).

## Blog comments

Meetup and community posts use [Giscus](https://giscus.app), backed by the
`General` discussion category in `pythonindia/bangalore.python.org.in`.
The repository and category IDs are configured under `giscus` in `_config.yml`.

The repository must be public, have Discussions enabled, and allow the
[Giscus GitHub app](https://github.com/apps/giscus) access to this repository.
If you change repositories or categories, use the Giscus configurator to obtain
the corresponding IDs. Clear `repo_id` to disable comments site-wide.

Comments are enabled on posts by default. Set `comments: false` in a post's
front matter to opt out. Discussions are matched to the article's pathname with
strict matching, so changing a title or the site's domain keeps the same thread;
changing its permalink requires migrating the discussion mapping. Giscus creates
the discussion when the first comment or reaction is submitted.

Posts can set `image_alt` in front matter to describe the cover photo for
screen reader users, for example `image_alt: "Attendees at the EPAM office"`.

Community posts belong in `_posts/community/` and inherit `hidden: true`.
This excludes them from meetup pagination while keeping them published in the
Community Blog, archives, and author pages.

### Setup Upstream and Maintain your forked repo.

1. Setup Upstream repo: `git remote add upstream git@github.com:pythonindia/bangalore.pythonindia.org.git`
2. Fetch upstream content: `git fetch upstream`
3. Checkout to master branch: `git checkout master`
4. Rebase with upstream master: `git rebase upstream/master`
5. Push (forcefully if needed): `git push -f origin master`
