# 5. AI coding agents

## Claude Code

Use the [official Claude Code installation guide](https://code.claude.com/docs/en/setup) and its native installer. Verify:

```bash
claude --version
command -v claude
claude doctor
claude auth login
claude auth status
```

The native installer may place `claude` in `~/.local/bin`; if the command is missing, add `export PATH="$HOME/.local/bin:$PATH"` to `~/.zshrc` once and `source ~/.zshrc`.

## OpenAI Codex CLI

Follow the [official Codex documentation](https://developers.openai.com/codex/cli/). One installation option with Node.js available is:

```bash
npm install -g @openai/codex
codex --version
codex login
codex login status
```

npm-installed global tools follow the selected Node runtime. Switching Node versions may change which global CLI installations are available.

## Project instructions instead of global policies

Use project-level `AGENTS.md` for Codex and `CLAUDE.md` for Claude Code when needed. A small `CLAUDE.md` can reference `AGENTS.md` if the instructions are shared, but confirm the agent actually loads the referenced file. Avoid duplicating Git identity settings in prompts: enforce normal routing in Git, SSH, and the CLI wrapper.

The agents' product login is independent of GitHub identity. An employer-managed AI account may be subject to organisational data policies even while GitHub operations use a personal account. Confirm authorised use before sending personal or confidential project code to that service.

## Read-only verification prompt

```text
Perform a read-only environment verification. Do not modify files or settings.
Run pwd, git config user.name, git config user.email, git remote -v,
command -v gh, gh api user --jq .login, and git status --short --branch.
Report exact failures; do not change permissions or network settings.
```

Check the output against the expected workspace identity. Agents can bypass PATH wrappers and network sandboxes may block GitHub API access. Do not treat a passing prompt check as a security guarantee.
