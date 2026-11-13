---
name: theme-sync
description: Keep the `vague` colors consistent between ghostty (ghostty/themes/vague) and nvim (vague.nvim + overrides in nvim/lua/jatobro/colorscheme.lua). Use when changing either theme or its colors.
---

- Ghostty theme: `ghostty/themes/vague` (upstream: vague-theme/vague-ghostty). Palette 0-15, background `#141415`, foreground `#cdcdcd`, selection `#252530`.
- Nvim: `vague.nvim` with `transparent = true`; `colorscheme.lua` overrides Normal/NormalNC/SignColumn/NormalFloat to `bg = none` and Cursor to fg `#141415` / bg `#cdcdcd`.

When changing one side, check the other still matches: background, foreground, cursor and selection colors must agree. Nvim backgrounds are transparent, so the ghostty background shows through — keep it `#141415`.
Nvim edits belong in the nvim submodule (see nvim-submodule-commit).
