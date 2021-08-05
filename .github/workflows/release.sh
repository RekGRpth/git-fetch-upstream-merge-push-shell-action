#!/bin/sh

set -eux
env | sort
hub api --method DELETE "repos/${GITHUB_REPOSITORY}/git/refs/v1" | jq .
hub release delete "${GITHUB_REF##*/}" || echo "$?"
hub release create --message "${INPUTS_MESSAGE:-release}" "${GITHUB_REF##*/}"
