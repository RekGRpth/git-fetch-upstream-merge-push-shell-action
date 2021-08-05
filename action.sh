#!/bin/sh

set -eux
env | sort
git remote add --fetch --track "${INPUTS_BRANCH:-${GITHUB_REF##*/}}" upstream "${INPUTS_URL}${INPUTS_REPOSITORY}.git"
git config --local user.email "${INPUTS_EMAIL}"
git config --local user.name "${INPUTS_NAME}"
git merge --allow-unrelated-histories "upstream/${INPUTS_BRANCH:-${GITHUB_REF##*/}}"
git push --progress --set-upstream origin "${INPUTS_BRANCH:-${GITHUB_REF##*/}}"
