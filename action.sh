#!/bin/bash

cd docs
echo '🎩 Install Jekyll'
gem install bundler jekyll
bundle install
bundle exec jekyll -v || exit 1

echo '🔨 Build site'
bundle exec jekyll build

echo '🧪 Deploy build'
git config user.name "${GITHUB_ACTOR}"
git config user.email "${GITHUB_ACTOR}@users.noreply.github.com"
git add .
git commit -am "🧪 Deploy with ${GITHUB_WORKFLOW}"
git push --all -f https://${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git
