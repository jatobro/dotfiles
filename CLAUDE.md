# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a macOS dotfiles repo rooted at `~/.config` (XDG config dir). There is no build, lint, or test tooling — changes are config edits that take effect when the relevant tool reloads its config.

## Tracked vs. untracked

Only a subset of directories is tracked: `aerospace`, `btop`, `ghostty`, `lazygit`, `mise`, `tmux`, and `nvim` (a git submodule). `1Password` and `containers` are gitignored. Others (`context7`, `gcloud`, `gh`, `git`, `k9s`, `nono`, `spotify-player`, `vite-plus`) are currently untracked and may contain credentials/state — don't `git add` them without checking contents.

## Layout notes

- `nvim/` is a submodule (`git@github.com:jatobro/nvim.git`). Edits there must be committed and pushed inside the submodule, then the pointer bumped in this repo.
  - Targets Neovim 0.12: plugins are managed with built-in `vim.pack` (`lua/jatobro/pack.lua`, lockfile `nvim-pack-lock.json`), not lazy.nvim/packer. `init.lua` loads one module per concern from `lua/jatobro/` (order matters: options → pack → plugin setups → colorscheme). LSP server configs live in `nvim/lsp/` (e.g. `lua_ls.lua`) and are enabled from `lua/jatobro/lsp.lua`. Add new plugins by appending to the `vim.pack.add` list, then adding a `require` in `init.lua`.
- `tmux/tmux.conf`: prefix is `C-a`, vim-style pane navigation, windows start at 1.
- `mise/config.toml`: global fallback runtimes (node, python, pnpm) with auto-install enabled.
- `ghostty/config.ghostty` with custom theme `ghostty/themes/vague` (matches the `vague` nvim colorscheme — keep them visually consistent).
- `aerospace/aerospace.toml`: tiling window manager config.

## Keeping the README current

When a change affects what `README.md` describes — tracked directories/tools, the contents table, install steps, theme, or the notes about untracked/gitignored dirs — update `README.md` in the same change. If a change doesn't affect it, leave it alone.
