#!/bin/bash
set -e

# Script inspired from following article to delpoy hugo static site with Travis:
# https://medium.com/swlh/hosting-a-hugo-blog-on-github-pages-with-travis-ci-e74a1d686f10

git_username="GabLeRoux"

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"
cd public

if [ -n "$GITHUB_AUTH_SECRET" ]
then
    touch ~/.git-credentials
    chmod 0600 ~/.git-credentials
    echo $GITHUB_AUTH_SECRET > ~/.git-credentials
    git config credential.helper store
    git config user.email "${git_username}@users.noreply.github.com"
    git config user.name "${git_username}"
fi

git add .
git commit -m "Rebuild site"
git push --force origin HEAD:master
