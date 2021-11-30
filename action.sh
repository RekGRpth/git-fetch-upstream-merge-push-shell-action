#!/bin/bash

set -eux
git remote add --fetch --track "${INPUTS_BRANCH:-${GITHUB_REF##*/}}" upstream "${INPUTS_URL:-${GITHUB_SERVER_URL}}/${INPUTS_REPOSITORY}.git"
git config --local user.email "${INPUTS_EMAIL:-actions@github.com}"
git config --local user.name "${INPUTS_NAME:-git merge upstream}"
git merge --allow-unrelated-histories "upstream/${INPUTS_BRANCH:-${GITHUB_REF##*/}}"
let DIFF=($(date +%s)-$(git --no-pager log -1 --format=%ct))/86400
if [ $DIFF -ge 50 ]; then
    git commit --allow-empty --message keepalive
fi
git push --progress
