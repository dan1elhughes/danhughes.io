---
title: "Fixing commits on the wrong branch"
date: 2019-02-10T12:30:00Z
draft: false
---

Let's say you're working on a new feature, but you realise that you've committed to `master` by accident.

There are ways to fix this by using `cherry-pick`, but I find this messy and unintuitive. Instead, I prefer to simply create my feature branch where I am and then "rewind" `master` to where it should be.

First, let's create the branch we should've started on, and push it up to be safe:

```
$ git checkout -b feature/my-feature-branch
$ git push
```

Here, it's worth checking on GitHub/Bitbucket that the feature branch is showing up as you expect it.

Now that the feature branch is safely on the remote, we can rewind our local master branch as if we never committed to it:

```
$ git reset --hard origin/master
```

This will **delete** the commits on master which we made by accident.

So now we have a feature branch with our commits on it, and a master branch which is clean with respect to the remote. This is actually my normal workflow; I find it easier to stay on `master` while working, and creating the feature branch when I'm happy that I have a complete logical unit of work ready for pull request.
