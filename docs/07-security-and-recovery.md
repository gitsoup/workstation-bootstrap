# 7. Security and recovery

## Never commit

- SSH private keys (`id_ed25519_*` without `.pub`).
- `~/.config/gh-*` or `hosts.yml`, OAuth tokens, API keys, cookies, credential helpers.
- `.env` files containing secrets, cloud credentials, or organisation policies.
- Full dumps of `~/.ssh`, `~/.claude`, `~/.codex`, or keychain state.

Public SSH keys can be shared with GitHub, but this repository intentionally contains **no real keys**.

## Identity-routing limits

- Git `user.name`/`user.email` are commit labels, not access control.
- `GH_CONFIG_DIR` affects the GitHub CLI, not every tool that talks to GitHub.
- SSH aliases apply only when the remote actually uses them.
- Git URL rewriting may not be active for an initial clone.
- Agents may call a different binary, use HTTPS, or run from another directory.
- Network permissions and AI service data-handling are separate from GitHub identity.

For sensitive repositories, consider stronger isolation (separate OS users or machines, managed credentials, explicit access controls) as appropriate.

## Recovery checklist

1. Install macOS updates, Command Line Tools, Homebrew, and the desired terminal.
2. Recreate workspace directories and reviewed Git templates.
3. Generate **new** SSH keys or restore keys through an approved secure process; register public keys.
4. Authenticate each GitHub account separately; never copy stored auth tokens into this repo.
5. Install the `gh` wrapper and verify PATH ordering.
6. Install mise, Node.js, uv, Python, and useful utilities.
7. Install and authenticate coding agents under the intended account/policy.
8. Run verification scripts and check a real repository before pushing.

## Safe publication checklist

- [ ] Search for real names, company names, emails, private domains, access tokens, and absolute home paths.
- [ ] Check `.gitignore` and `git status` before committing.
- [ ] Inspect the rendered GitHub Pages site for accidental sensitive data.
- [ ] Never publish private repo names or confidential architecture in examples.
