# 4. Development runtimes and utilities

## Install mise and Node.js

```bash
brew install mise
```

Add once to `~/.zshrc`:

```bash
eval "$(mise activate zsh)"
```

Then:

```bash
source ~/.zshrc
mise doctor
mise use --global node@lts
node --version
npm --version
```

`which mise` may display a shell function after activation; this is expected. For a project-specific Node version, use `mise use node@<version>` inside the project and review the generated config before committing it.

## Install uv and managed Python

```bash
brew install uv
uv python install 3.14
uv run --python 3.14 python --version
python3 --version
```

Do not overwrite `/usr/bin/python3`. For existing projects, respect their required Python version rather than forcing the newest runtime. Prefer virtual environments and lockfiles.

## Useful utilities

```bash
brew install ripgrep fd fzf tree wget
```

`jq` may already be supplied by macOS. Check with `command -v jq`. `fzf` shell and Vim integration are optional; skip unless needed. Avoid changing terminal shell integration just to enable fuzzy-search shortcuts.

## Terminal reloads

- `source ~/.zshrc`: apply changes in the current shell.
- `rehash`: refresh zsh command lookup.
- `exec zsh -l`: replace the current shell; may disrupt terminal integrations. Usually unnecessary for PATH changes.
