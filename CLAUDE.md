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
3. Runs `keychain --eval ~/.ssh/id_ed25519 | source` to start/reuse an SSH agent

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
