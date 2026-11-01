# 3. GitHub CLI with two accounts

Install GitHub CLI:

```bash
brew install gh
```

Authenticate **each account separately**, with different `GH_CONFIG_DIR` values:

```bash
GH_CONFIG_DIR="$HOME/.config/gh-personal" /opt/homebrew/bin/gh auth login
GH_CONFIG_DIR="$HOME/.config/gh-work" /opt/homebrew/bin/gh auth login
```

Choose the matching GitHub account in each browser login. Follow CLI prompts for authentication protocol. For repository Git operations, use the SSH aliases from the previous guide.

## Install the directory-aware wrapper

```bash
mkdir -p "$HOME/bin"
cp examples/gh-wrapper "$HOME/bin/gh"
chmod 755 "$HOME/bin/gh"
```

The wrapper assumes the `gh` binary is at `/opt/homebrew/bin/gh`. Adjust it if needed. Add the following to `~/.zshrc` **once**:

```bash
export PATH="$HOME/bin:$PATH"
```

Apply the change with `source ~/.zshrc` (no shell replacement needed). Run `command -v gh`; it should show `~/bin/gh`.

## Verify

```bash
(cd "$HOME/repos/personal" && gh api user --jq .login)
(cd "$HOME/repos/work" && gh api user --jq .login)
(cd "$HOME" && gh api user --jq .login)  # should refuse
```

The wrapper uses the current process working directory, **not** a repository's remote owner. `cd` into the correct directory before calling `gh`. Explicit binary paths, environment overrides, tools that change directories, or custom subprocess environments can bypass it.

If an AI agent's sandbox blocks network access, `gh api` may fail inside the agent while working in the terminal. Verify outside the sandbox and adjust agent network permissions only for a specific need.
