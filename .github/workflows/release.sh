#!/bin/sh

set -eux
hub release delete "${GITHUB_REF##*/}" || echo "$?"
hub api --method DELETE "repos/${GITHUB_REPOSITORY}/git/refs/${GITHUB_REF##*/}" | jq .
hub release create --message "${INPUTS_MESSAGE:-release}" "${GITHUB_REF##*/}"
