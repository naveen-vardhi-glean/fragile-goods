# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a [chezmoi](https://www.chezmoi.io/) dotfiles repository for managing personal configuration files across machines. Chezmoi is a dotfile manager that uses a source directory (this repo) to manage target files in the home directory.

## Chezmoi File Naming Conventions

- `dot_` prefix becomes `.` in the target (e.g., `dot_gitconfig` -> `~/.gitconfig`)
- `private_` prefix sets restrictive permissions (0600)
- `executable_` prefix makes the file executable
- `run_` prefix indicates a script that runs on `chezmoi apply`
- Files ending in `.tmpl` are Go templates

## Commands

```bash
# Apply dotfiles to home directory
chezmoi apply

# Preview changes without applying
chezmoi diff

# Add a new file to be managed
chezmoi add ~/.some_config

# Edit a managed file
chezmoi edit ~/.some_config

# Bootstrap a new machine (runs OS-specific setup)
./bootstrap.sh
```

## Structure

- `dot_gitconfig` - Git configuration with aliases, delta pager, difftastic diff tool, and ediff merge tool
- `dot_gitignore` - Global gitignore patterns
- `bootstrap.sh` - Entry point that delegates to OS-specific bootstrap scripts (`bootstrap_linux.sh`, `bootstrap_osx.sh`, `bootstrap_freebsd.sh`) and `bootstrap_common.sh`
