# dotfiles

Personal macOS configuration, kept in `~/.config`.

## Contents

| Directory | Tool | Notes |
| --- | --- | --- |
| `nvim` | [Neovim](https://neovim.io) | Git submodule ([jatobro/nvim](https://github.com/jatobro/nvim)); Neovim 0.12 with built-in `vim.pack` |
| `ghostty` | [Ghostty](https://ghostty.org) | Hack Nerd Font, translucent/blurred background, custom `vague` theme |
| `tmux` | [tmux](https://github.com/tmux/tmux) | Prefix `C-a`, vim-style pane navigation, mouse on |
| `aerospace` | [AeroSpace](https://github.com/nikitabobko/AeroSpace) | Tiling window manager, starts at login |
| `mise` | [mise](https://mise.jdx.dev) | Global fallback runtimes (node, python, pnpm) |
| `lazygit` | [lazygit](https://github.com/jesseduffield/lazygit) | Git TUI config |
| `btop` | [btop](https://github.com/aristocratos/btop) | System monitor config |

The theme throughout is [vague](https://github.com/vague-theme/vague.nvim).

## Install

Clone into `~/.config`, including the nvim submodule:

```sh
git clone --recurse-submodules git@github.com:jatobro/.config.git ~/.config
```

If already cloned without submodules:

```sh
git submodule update --init
```

Then install the tools above (e.g. via Homebrew) and the Hack Nerd Font.

## Notes

- `1Password` and `containers` are gitignored.
- Some other tool directories (`gh`, `gcloud`, `git`, `k9s`, etc.) may exist locally but are untracked; they can contain credentials, so review before adding.
- Changes to `nvim` must be committed and pushed inside the submodule, then the submodule pointer updated here.
