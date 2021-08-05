# git fetch upstream merge upstream push action

![Repository License](https://img.shields.io/github/license/RekGRpth/git-fetch-upstream-merge-upstream-push-action)
![Repository Release](https://img.shields.io/github/v/release/RekGRpth/git-fetch-upstream-merge-upstream-push-action)

1) fetch defined upstream of defined repository
2) merge this upstream to current workflow repository
3) push current workflow repository

### usage

```yaml
- uses: rekgrpth/git-fetch-upstream-merge-upstream-push-action@v1
  with:
    branch: master # branch to fetch, default: current workflow branch (usually it is repository default branch (usually it is master))
    email: actions@github.com # user.email to merge, default: actions@github.com
    name: git merge upstream # user.name to merge, default: git merge upstream
    repository: owner/name # repository from fetch, required
    url: https://github.com/ # fetch repository url, default https://github.com/
```
