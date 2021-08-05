#!/bin/sh

set -eux
env | sort
hub release delete "${GITHUB_REF##*/}" || echo "$?"
hub api --method DELETE "repos/${GITHUB_REPOSITORY}/releases/tag/${GITHUB_REF##*/}" | jq .
hub release create --message "${INPUTS_MESSAGE:-release}" "${GITHUB_REF##*/}"
