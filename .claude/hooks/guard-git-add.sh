#!/usr/bin/env bash
# Block `git add` that could stage untracked credential/state directories.
cmd=$(jq -r '.tool_input.command // empty')
echo "$cmd" | grep -Eq '(^|[;&|[:space:]])git[[:space:]]+(-C[[:space:]]+[^[:space:]]+[[:space:]]+)?add([[:space:]]|$)' || exit 0

blocked='(^|[[:space:]/])(gh|gcloud|1Password|spotify-player|context7|nono|k9s|containers|git|vite-plus)(/|[[:space:]]|$)'
broad='add[[:space:]]+(-A|--all|\.|-u|--update)([[:space:]]|$)'

if echo "$cmd" | grep -Eq "$broad" || echo "$cmd" | sed -E 's/^.*git[[:space:]]+add//' | grep -Eq "$blocked"; then
  echo "Blocked: this git add may stage untracked credential/state dirs (gh, gcloud, context7, nono, ...). Add explicit tracked paths instead, and check contents first." >&2
  exit 2
fi
exit 0
