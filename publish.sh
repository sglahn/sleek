#!/bin/bash

git config --global user.name "$(git --no-pager show --no-patch --format='%an')"
git config --global user.email "$(git --no-pager show --no-patch --format='%ae')"

git clone -b master --depth 1 https://github.com/sglahn/sglahn.github.com.git _site

rm -rf _site/*

bundle exec jekyll build || -1

cd _site

echo "blog.tldnr.org" > CNAME

git add -A

git commit -m "Updated"

git push

