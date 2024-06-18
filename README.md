# BangPypers

Source code for Bangalore Python User Group Blog. Read blog at  https://bangalore.pythonindia.org

## Setup Locally:

Follow [Testing your GitHub Pages site locally with Jekyll](https://docs.github.com/en/pages/setting-up-a-github-pages-site-with-jekyll/testing-your-github-pages-site-locally-with-jekyll)

## Run:

```sh
bundle exec jekyll serve
```

You can use `--livereload` to keep auto-updating changes.

### Setup Upstream and Maintain your forked repo.

1. Setup Upstream repo: `git remote add upstream git@github.com:pythonindia/bangalore.pythonindia.org.git`
2. Fetch upstream content: `git fetch upstream`
3. Checkout to master branch: `git checkout master`
4. Rebase with upstream master: `git rebase upstream/master`
5. Push (forcefully if needed): `git push -f origin master`
