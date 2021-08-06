# git fetch upstream merge push shell action 

## 1) fetch defined upstream of defined repository
## 2) merge this upstream to current workflow repository
## 3) push current workflow repository

### usage

```yml
env:
  GITHUB_TOKEN: ${{ github.token }}
runs-on: ubuntu-latest
steps:
  - uses: rekgrpth/git-clone-shell-action@v1
  - env:
      INPUTS_BRANCH: master # branch to fetch, default: current workflow branch (usually it is repository default branch (usually it is master))
      INPUTS_EMAIL: actions@github.com # user.email to merge, default: actions@github.com
      INPUTS_NAME: git merge upstream # user.name to merge, default: git merge upstream
      INPUTS_REPOSITORY: owner/name # repository from fetch, required
      INPUTS_URL: https://github.com # fetch repository url, default https://github.com
    uses: rekgrpth/git-fetch-upstream-merge-push-shell-action@v1
```
