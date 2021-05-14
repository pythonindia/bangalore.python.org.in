#!/bin/bash
set -e && \
cd ./_site && \
remote_branch="gh-pages" && \
git init && \
git config user.name "Travis-CI" && \
git config user.email "contact@travis-ci.com" && \
git add . && \
git commit -m'Deployed to Github' && \
git push --force --quiet "https://${GH_TOKEN}@${GH_REF}" master:$remote_branch > /dev/null 2>&1 && \
rm -fr .git && \
cd ../
