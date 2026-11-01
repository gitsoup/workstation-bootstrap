# 1. Prerequisites and setup order

**Platform:** Apple Silicon macOS with zsh. Intel Macs need different Homebrew paths.

## Recommended sequence

1. Update macOS, then install or update Xcode Command Line Tools.
2. Install Warp or another terminal (optional).
3. Install Homebrew from its [official site](https://brew.sh/).
4. Configure Git workspace folders and identity isolation.
5. Create SSH keys and register **public** keys with the correct GitHub accounts.
6. Install GitHub CLI and configure independent authentication directories.
7. Add the directory-aware `gh` wrapper.
8. Install mise, Node.js LTS, uv, Python, and CLI utilities.
9. Install Claude Code and Codex; authenticate independently.
10. Run verification checks before cloning or pushing code.

## Baseline diagnostics

```bash
sw_vers -productVersion
uname -m
xcode-select -p
brew doctor
```

If Command Line Tools are absent, run `xcode-select --install`. If they are outdated, inspect `softwareupdate --list` and install the exact applicable Command Line Tools label. Do not assume a fixed version label.

For Homebrew installation, follow https://brew.sh/ rather than copying a third-party installer. On Apple Silicon, `brew` is typically at `/opt/homebrew/bin/brew`.

## Workspace folders

```bash
mkdir -p "$HOME/repos/personal" "$HOME/repos/work"
```

The terms *personal* and *work* are examples. Keep the directories stable after configuring Git and CLI routing.
