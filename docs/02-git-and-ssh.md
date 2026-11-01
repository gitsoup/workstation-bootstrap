# 2. Git and SSH identity separation

## Configure Git commit identities

Copy the [global Git config template](../examples/gitconfig) into `~/.gitconfig` **after reviewing and merging with any existing configuration**. Copy [personal](../examples/gitconfig-personal) and [work](../examples/gitconfig-work) templates into `~/.gitconfig-personal` and `~/.gitconfig-work`.

Replace the placeholder names and GitHub noreply emails with your actual accounts. Use `git config --global user.useConfigOnly true` to prevent silent fallback to a wrong identity.

`includeIf "gitdir:~/repos/personal/"` matches repositories located beneath that directory, including nested repositories; it does **not** automatically apply to a new clone before its `.git` directory exists.

**Important:** `git config user.name` determines commit metadata; it does not authenticate GitHub operations.

## Generate dedicated SSH keys

```bash
ssh-keygen -t ed25519 -C "personal-github" -f "$HOME/.ssh/id_ed25519_personal"
ssh-keygen -t ed25519 -C "work-github" -f "$HOME/.ssh/id_ed25519_work"
chmod 600 "$HOME/.ssh/id_ed25519_personal" "$HOME/.ssh/id_ed25519_work"
```

Use a passphrase where practical. Upload only the contents of each `.pub` file to the corresponding GitHub account under **Settings → SSH and GPG keys**. Never upload or commit private keys.

Merge [SSH config template](../examples/ssh-config) into `~/.ssh/config` and run `chmod 600 ~/.ssh/config`. Check the official GitHub SSH host key fingerprints before accepting a new host key.

## Verify authentication

```bash
ssh -T git@github-personal
ssh -T git@github-work
```

GitHub normally returns an authenticated greeting but exits with status 1 because it does not provide shell access.

## Clone with an explicit alias

```bash
cd "$HOME/repos/personal"
git clone git@github-personal:PERSONAL_LOGIN/REPOSITORY.git

cd "$HOME/repos/work"
git clone git@github-work:WORK_LOGIN/REPOSITORY.git
```

**Do not rely on Git `insteadOf` rewrites for initial cloning from an empty workspace.** The repository-scoped `includeIf` may not be active until the repository exists. For subsequent operations, explicit SSH-alias remotes remain easiest to audit.

## Optional URL rewriting

The identity templates include commented-out `url.*.insteadOf` rules. Enable only if you understand how they interact with `includeIf`, remotes, and clones. Explicit SSH aliases are preferred for clarity.
