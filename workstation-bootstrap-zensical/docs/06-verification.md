# 6. Verification and troubleshooting

Run the included read-only checks:

```bash
bash scripts/check-tools.sh
bash scripts/check-workspaces.sh
```

For each real repository:

```bash
pwd
git config user.name
git config user.email
git remote -v
command -v gh
gh api user --jq .login
git status --short --branch
```

Expected outcomes:

| Workspace | Git commit identity | SSH alias | gh login |
| --- | --- | --- | --- |
| `~/repos/personal` | Personal account | `github-personal` | Personal account |
| `~/repos/work` | Work account | `github-work` | Work account |
| Outside both | No default commit identity | No implied alias | Wrapper refuses |

## Common issues

- **`claude: command not found`:** Check `~/.local/bin` in PATH and run `source ~/.zshrc`.
- **`which mise` shows a function:** Normal after `mise activate zsh`.
- **`gh api` works in Warp but fails inside Codex:** Likely agent sandbox networking; verify with a direct terminal command before changing permissions.
- **Wrong SSH account:** Check `git remote -v`, SSH alias, `IdentitiesOnly`, and the correct public key registration.
- **Wrong Git author:** Check current repository path, `git config --show-origin --get user.email`, and local overrides.
- **Homebrew warns about Command Line Tools:** Check `softwareupdate --list`, install the appropriate CLT update, then `brew doctor`.
- **`git status` shows `main...origin/main`:** It reports tracking relative to locally stored remote refs; it does not prove a fresh remote fetch occurred.

## End-of-setup checks

```bash
sw_vers -productVersion
uname -m
brew doctor
mise doctor
node --version
uv --version
claude --version
codex --version
```
