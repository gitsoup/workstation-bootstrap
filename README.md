# Developer Workstation Bootstrap

A practical, reproducible setup for an **Apple Silicon macOS** development workstation with two GitHub identities (**personal** and **work**), isolated Git/SSH/GitHub CLI configuration, modern JavaScript and Python tooling, and AI coding assistants.

No organisation-specific names, real usernames, hostnames, emails, or credentials are included.

> **Security model:** Directory-based routing is a convenience and error-reduction mechanism, **not** a security boundary. Git's `includeIf` selects commit identity, SSH host aliases select keys, and a `gh` wrapper selects CLI authentication. Agents and users can bypass these mechanisms with different commands, working directories, explicit overrides, or HTTPS remotes. Review destinations before publishing or pushing.

## Start here

1. [Prerequisites and setup order](docs/01-prerequisites.md)
2. [Git identities and SSH keys](docs/02-git-and-ssh.md)
3. [GitHub CLI account routing](docs/03-github-cli.md)
4. [Development runtimes and utilities](docs/04-tooling.md)
5. [Claude Code and Codex](docs/05-ai-agents.md)
6. [Verification and troubleshooting](docs/06-verification.md)
7. [Security and recovery](docs/07-security-and-recovery.md)

## Design

```text
~/repos/
├── personal/    # Git commit identity A, SSH alias github-personal, gh config A
└── work/        # Git commit identity B, SSH alias github-work, gh config B
```

The setup uses:

- Homebrew for packages; mise for Node.js LTS; uv for managed Python.
- Git `includeIf` for per-workspace commit metadata, with `user.useConfigOnly=true`.
- Dedicated SSH keys and host aliases for each GitHub account.
- Separate `GH_CONFIG_DIR` directories, selected by a small `gh` wrapper.
- Claude Code native installation and Codex CLI installation.
- Project-local `AGENTS.md` / `CLAUDE.md` only when a project needs instructions.

## Quick checks

```bash
bash scripts/check-tools.sh
bash scripts/check-workspaces.sh
```

Both scripts are read-only. They print configuration details but never credentials.

## Reuse and publishing

Clone this repository, read the guides, then copy and adapt the files in `examples/`. Do not run templates unchanged: replace placeholders first. The repository includes a GitHub Pages workflow for publishing Markdown through Jekyll once Pages is enabled in repository settings. You can keep the repository private and use the Markdown directly instead.

## Scope

This is a **setup reference**, not a fully automated bootstrap installer. Account authentication and SSH public-key registration are deliberately manual. Version numbers are not pinned: verify current supported versions and official installation instructions before running commands.
