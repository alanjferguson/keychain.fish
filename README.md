# keychain.fish

A [Fish shell](https://fishshell.com/) plugin that integrates [keychain](https://github.com/danielrobbins/keychain), a front-end for `ssh-agent` and `ssh-add`. It automatically starts the SSH agent and loads your keys on every interactive shell session.

## Installation

Using [Fisher](https://github.com/jorgebucaran/fisher):

```fish
fisher install alanjferguson/keychain.fish
```

## Configuration

Set which SSH keys to load (required):

```fish
set -U keychain_keys ~/.ssh/id_ed25519
```

Optionally configure extra keychain flags (defaults to `--quiet`):

```fish
set -U keychain_options --quiet --timeout 300
```

## Dependencies

- [Fish shell](https://fishshell.com/) 3.1+
- [keychain](https://github.com/danielrobbins/keychain)
