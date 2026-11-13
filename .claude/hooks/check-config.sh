#!/usr/bin/env bash
# Quick syntax check after editing config files. Exit 2 feeds errors back to Claude.
f=$(jq -r '.tool_input.file_path // empty')
[ -f "$f" ] || exit 0
case "$f" in
  *.lua)
    if command -v stylua >/dev/null; then
      cfg=$(dirname "$f"); out=$(cd "$cfg" && stylua --check "$f" 2>&1) || { echo "$out" >&2; exit 2; }
    elif command -v luac >/dev/null; then
      out=$(luac -p "$f" 2>&1) || { echo "$out" >&2; exit 2; }
    fi ;;
  *.toml)
    if command -v taplo >/dev/null; then
      out=$(taplo check "$f" 2>&1) || { echo "$out" >&2; exit 2; }
    fi ;;
  */tmux/tmux.conf)
    out=$(tmux -L claude-check -f "$f" start-server \; kill-server 2>&1) || { echo "$out" >&2; exit 2; } ;;
esac
exit 0
