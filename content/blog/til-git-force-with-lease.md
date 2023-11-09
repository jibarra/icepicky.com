---
title: "TIL: Git Force With Lease"
date: 2023-11-08T15:44:43-07:00
draft: false
tags:
- til
---

Today I learned about [the Git `--force-with-lease` command](https://git-scm.com/docs/git-push#Documentation/git-push.txt---force-with-leaseltrefnamegt).

I'll restate a description of the command but it allows you to rebase and force push with less risks than using `--force`. If you had pushed your changes up to a remote branch and somebody else had pushed up new changes to that remote branch while you're rebasing. After you finish rebasing, a normal `git push` will fail because the local refs don't match the remote ones. Usually people will `git push --force` at this point because they were just rebasing their branch. However, this would wipe away commits on the remote branch. This is easy to do if you're working on a branch and don't realize that somebody else had commit to it.

Instead, you can use `git push --force-with-lease` to ensure that you can't force a push if more commits were added to the remote branch than there are locally. This helps ensure that new commits in the remote branch aren't blindly overwritten. It's incredibly useful if you're working on a branch as a group or if your branch is generally public.

I rarely rebase nowadays after I consider my remote branches public. When other folks are collaborating, it makes it harder after rebasing because everyone's locals need to be fixed up after a rebase and force push. When I've requested a review, it makes re-reviewing harder because Github loses history of what was viewed previously. However, occasionally I like to rebase to cleanup a branch with a messy commit history so knowing about `--force-with-lease` ensures I can rebase more safely.

After learning about the command, I've created some [aliases in my dotfiles](https://github.com/jibarra/.dotfiles/blob/10aca3551c6084c5a355aab5a460bad05e447165/git/.gitconfig#L35-L36) to shorten the command for me when I need it. It'll help me use it when I need it so I don't have to type out all of `--force-with-lease` every time I rebase.
