#!/bin/bash
# from https://medium.com/@nthgergo/publishing-gh-pages-with-travis-ci-53a8270e87db#.7cncb5854
rm -rf _site || exit 0;

Rscript build.R

cd _site
git init

git config user.name "Travis-CI"
git config user.email "travis@nobody.org"

cp ../CNAME ./CNAME
touch .nojekyll

git add .
git commit -m "Deployed to Github Pages"
git push --force --quiet "https://${GITHUB_TOKEN}@github.com/${GITHUB_REPO}" master:gh-pages > /dev/null 2>&1

