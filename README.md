# BangPypers

Source code for Bangalore Python User Group Blog. Read blog at  https://bangalore.pythonindia.org

## Setup Locally:

Follow [Testing your GitHub Pages site locally with Jekyll](https://docs.github.com/en/pages/setting-up-a-github-pages-site-with-jekyll/testing-your-github-pages-site-locally-with-jekyll)

## Run:

```sh
bundle exec jekyll serve
```

You can use `--livereload` to keep auto-updating changes.

## Blog checks

```sh
bundle exec ruby scripts/check_blogs.rb
```

This renders the site and checks meetup pagination, community article cards,
and the Giscus embed, including posts that opt out of comments.

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

Community posts belong in `_posts/community/` and inherit `hidden: true`.
This excludes them from meetup pagination while keeping them published in the
Community Blog, archives, and author pages.

### Setup Upstream and Maintain your forked repo.

1. Setup Upstream repo: `git remote add upstream git@github.com:pythonindia/bangalore.pythonindia.org.git`
2. Fetch upstream content: `git fetch upstream`
3. Checkout to master branch: `git checkout master`
4. Rebase with upstream master: `git rebase upstream/master`
5. Push (forcefully if needed): `git push -f origin master`
