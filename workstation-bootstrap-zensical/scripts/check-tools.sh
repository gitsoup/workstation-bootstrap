#!/bin/bash
# Read-only diagnostics; no credential output.
set -u
printf '%s\n' '=== SYSTEM ==='
sw_vers -productVersion 2>/dev/null || true
uname -m
printf '%s\n' '=== TOOL AVAILABILITY ==='
for tool in brew git mise node npm uv python3 claude codex gh jq rg fd fzf tree wget; do
  if command -v "$tool" >/dev/null 2>&1; then
    printf '%-9s %s\n' "$tool" "$(command -v "$tool")"
  else
    printf '%-9s %s\n' "$tool" 'MISSING'
  fi
done
printf '%s\n' '=== HOMEBREW ==='
if command -v brew >/dev/null 2>&1; then brew doctor; fi
