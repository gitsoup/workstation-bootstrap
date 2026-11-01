# Workstation Bootstrap

A practical, reproducible **Apple Silicon macOS** setup guide covering separate personal and work GitHub identities, modern development tooling, and AI coding assistants.

**[Read the documentation website](https://gitsoup.github.io/workstation-bootstrap/)** · [Start setup](https://gitsoup.github.io/workstation-bootstrap/01-prerequisites/) · [Security model](https://gitsoup.github.io/workstation-bootstrap/07-security-and-recovery/)

## What this covers

- **Foundation:** macOS, Xcode Command Line Tools, Homebrew, and a terminal.
- **Identity routing:** Git `includeIf`, independent SSH keys and host aliases, and separate GitHub CLI authentication directories.
- **Development runtimes:** mise, Node.js LTS, uv, managed Python, and terminal utilities.
- **AI coding tools:** Claude Code and Codex, with project-level instructions when useful.
- **Verification and recovery:** read-only checks, limitations, and migration guidance.

## Repository layout

```text
mkdocs.yml                    Site configuration and navigation
docs/                         Published Markdown guides
  index.md                    Documentation landing page
  assets/                     Theme styles and icons
examples/                     Generic Git, SSH, and CLI templates
scripts/                      Read-only verification scripts
.github/workflows/pages.yml   GitHub Pages deployment
requirements-docs.txt         Documentation build dependencies
```

## Local preview

Requires Python 3.10+ and pip (preferably in a virtual environment):

```bash
python3 -m venv .venv
source .venv/bin/activate
python -m pip install -r requirements-docs.txt
mkdocs serve
```

Visit `http://127.0.0.1:8000/`. Build strictly with `mkdocs build --strict`.

## Publishing

Set **Settings → Pages → Build and deployment → Source: GitHub Actions**. Push to `main`; the workflow builds the site with Zensical and deploys it to GitHub Pages. You can also run the workflow manually from the Actions tab.

## Security

Directory-based routing is **not a security boundary**. Git, SSH, and GitHub CLI configuration reduce mistakes but can be bypassed by explicit overrides, working-directory changes, or alternate remotes. Never commit credentials, private SSH keys, or authenticated CLI configuration.

## Scope

This repository is documentation and examples, not an unattended installer. Review all commands and substitute your own account names and email addresses before applying configuration. No real personal or employer identifiers are required by the setup instructions.

Licensed under MIT; see [LICENSE](LICENSE).

## Documentation website

The site uses [Zensical](https://zensical.org/) and is deployed to GitHub Pages using `.github/workflows/pages.yml`.

Preview locally (requires Python and pip):

```bash
python3 -m venv .venv
source .venv/bin/activate
python -m pip install zensical
zensical serve
```

The GitHub Pages repository setting must remain **Source: GitHub Actions**.
