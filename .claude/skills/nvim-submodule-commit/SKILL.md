---
name: nvim-submodule-commit
description: Commit and push changes made inside the nvim submodule, then bump the submodule pointer in the ~/.config repo. Use when nvim/ has changes to ship.
---

`nvim/` is a git submodule (`git@github.com:jatobro/nvim.git`). Order matters:

1. `git -C nvim status` — review changes; ensure nothing sensitive is staged.
2. Commit inside the submodule (stage explicit paths), then `git -C nvim push`. Ask the user before committing/pushing.
3. Back in the outer repo: `git status` should show `modified: nvim (new commits)`.
4. `git add nvim` and commit with a message like `bump nvim`. Ask before pushing the outer repo.

Never bump the pointer before the submodule commit is pushed, or other clones can't fetch it.
Never use `git add -A`/`git add .` in the outer repo (untracked credential dirs).
