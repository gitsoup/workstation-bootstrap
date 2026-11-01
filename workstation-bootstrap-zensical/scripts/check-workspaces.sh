#!/bin/bash
# Read-only workspace checks. API calls require network access.
set -u
for label in personal work; do
  dir="$HOME/repos/$label"
  printf '\n=== %s ===\n' "$label"
  if [ ! -d "$dir" ]; then printf 'MISSING: %s\n' "$dir"; continue; fi
  (
    cd "$dir" || exit 1
    printf 'directory: %s\n' "$PWD"
    printf 'gh executable: '; command -v gh || true
    printf 'gh login: '; gh api user --jq .login 2>&1 || true
    # Git includeIf is applied to Git repositories, not arbitrary empty directories.
    printf 'SSH alias: github-%s (test with ssh -T git@github-%s)\n' "$label" "$label"
  )
done
printf '\nOutside-workspace wrapper check: '
(cd "$HOME" && gh api user --jq .login 2>&1) || true
