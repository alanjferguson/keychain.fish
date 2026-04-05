# CLAUDE.md

## Project Overview

A minimal Fish shell plugin that integrates the [keychain](https://github.com/danielrobbins/keychain) SSH key manager. It automatically initializes the SSH agent and loads SSH keys when opening an interactive Fish shell session.

**Author:** Alan J. Ferguson  
**License:** MIT

## Repository Structure

```
conf.d/
  keychain.fish    # Main plugin script (auto-loaded by Fish shell)
LICENSE.txt        # MIT license
README.md          # Project description
```

## How It Works

The single source file `conf.d/keychain.fish` runs on every interactive shell startup:
1. Checks if the shell is interactive (`status is-interactive`)
2. Checks if the `keychain` command is available (`type -q keychain`)
3. Initializes default options if `$keychain_options` is not set
4. If `$keychain_keys` is configured, runs `keychain --eval $keychain_options $keychain_keys | source`
5. If no keys are configured, prints a message telling the user how to set up

## Configuration

Both variables are Fish **universal variables** (persist across sessions).

- **`$keychain_keys`** (required) — List of SSH key paths to load. No default; the plugin prints setup instructions if unset.
  ```fish
  set -U keychain_keys ~/.ssh/id_ed25519
  set -U keychain_keys ~/.ssh/id_ed25519 ~/.ssh/github_key
  ```

- **`$keychain_options`** (optional) — Extra flags passed to keychain. Defaults to `--quiet`. Note: `--eval` is always passed automatically as it is required for the plugin to function.
  ```fish
  set -U keychain_options --quiet
  set -U keychain_options --quiet --timeout 300
  set -U keychain_options --quiet --agents gpg,ssh
  ```

## Development

- **Language:** Fish shell script
- **Build system:** None — single script, no compilation
- **Tests:** None
- **CI/CD:** None
- **Linting:** None configured

### Installation

Copy `conf.d/keychain.fish` into `~/.config/fish/conf.d/`.

### Runtime Dependencies

- **Fish shell** (3.1+)
- **keychain** utility (`https://github.com/danielrobbins/keychain`) — must be installed separately

## Conventions

- **Indentation:** 2 spaces
- **Fish idioms:** Use `status is-interactive`, `type -q` for checks
- **Directory structure:** Follow the Fish `conf.d/` convention for auto-loaded scripts
- **Commit messages:** Short, descriptive subject lines
