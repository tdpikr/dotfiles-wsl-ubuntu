# dotfiles-wsl-ubuntu

## Acknowledgments

The Tmux configuration is mainly inspired by:

- [Catppuccin Tmux Configuration GitHub Discussion #317](https://github.com/catppuccin/tmux/discussions/317#discussioncomment-11064512)
- [Tmux Setup Tutorial (YouTube)](https://www.youtube.com/watch?v=DzNmUNvnB04)

## Overview

This repository contains my personal dotfiles tailored for Ubuntu running in Windows Subsystem for Linux (WSL).
These configurations will help you set up your development environment quickly and efficiently with my preferred tools
and settings.

Additionally, the `.gitignore` is configured to ignore all files except those necessary for this configuration, ensuring
that only relevant files are tracked and versioned.

## Features

- **Automated Bootstrap Script:** Quickly sets up the development environment by installing essential packages,
  configuring Git, generating an SSH key, and setting up Rust and Cargo.
- **Custom Zsh Configuration:** Includes Oh My Zsh with selected plugins such as `vi-mode`, `zsh-vimode-visual`,
  `ssh-agent`, and `zsh-autosuggestions` for enhanced shell experience.
- **Tmux Configuration:** Fully customized tmux setup with:
    - Vim-style pane navigation and resizing.
    - Clipboard integration using `xclip`.
    - Plugin management via TPM (Tmux Plugin Manager) with useful plugins including session resurrect, system stats,
      online status, battery indicator, and the stylish Catppuccin color scheme.
    - Enhanced status bar with battery, memory, CPU, time, and online/offline status indicators.
- **Aliases and Functions:** Custom aliases and function helpers, e.g., using vim in place of nano with sudo.
- **Shell Enhancements:** Zsh syntax highlighting for improved command-line readability.
- **Rust Environment:** Automatic installation of Rust toolchain and Cargo-installed tools like `aichat`.
- **WSL Optimizations:** Automatically starts tmux on shell startup and sets up the environment optimized for WSL usage.

## Requirements

- Windows with WSL installed
- Ubuntu distribution installed in WSL
- Git and Bash available in WSL
- Nerdfont installed and configured in Windows Terminal settings

## Installation and Setup

```bash
#!/bin/bash

# Initialize Git repository
git init

# Set up the remote and fetch the repository
git remote add origin https://github.com/tdpikr/dotfiles-wsl-ubuntu.git
git fetch
git checkout main

# Execute the bootstrap script
# Note: Please use 'bash bootstrap.sh' to run the script for full compatibility; running with 'sh' may cause errors.
# Providing an email address is optional; you may enter any value. Please note, you will be prompted multiple times for
# your password when using `sudo` or `ssh`.
# After completion, you will be automatically placed inside a tmux session. **It is recommended to fully exit WSL and
# restart your terminal once the script finishes.**
bash bootstrap.sh
```


