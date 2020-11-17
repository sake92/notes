
Essential commands: https://rogerdudler.github.io/git-guide/

Revert to previous commit:
https://stackoverflow.com/a/12049323/4496364

## Sync a fork

When you fork a project and it goes too far, you need to resync your fork.  
I usually reset whole master branch and then checkout a new one to make a new PR...

If you don't have `upstream` configured when you run `git remote -v`, do this:
```bash
git remote add upstream https://github.com/ORIGINAL_OWNER/ORIGINAL_REPOSITORY.git
```

then do the main stuff, from `master` branch:
```bash
git fetch upstream
git merge upstream/master
git reset --hard upstream/master
git push origin master
```

If last line doesn't let you, just do `git push origin master --force`. #YOLO
