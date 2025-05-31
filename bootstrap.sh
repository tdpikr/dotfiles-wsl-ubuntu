#!/bin/bash

# WSL Ubuntu setup

## Get distro facts
source /etc/os-release
echo "Detected OS: $NAME $VERSION"

## Get email for ssh/git setup
read -p "Enter email: " SETUP_EMAIL

## Install packages
sudo apt-get update
sudo apt-get install -y \
  tmux \
  openssh-client \
  build-essential \
  cmake \
  zsh \
  curl \
  python3-pip \
  pipx \
  ripgrep \
  zsh-syntax-highlighting \
  fd-find &&
  sudo apt-get clean

## Install Cargo
curl https://sh.rustup.rs -sSf | sh -s -- -y
source "$HOME/.cargo/env"

# Install Aichat
cargo install aichat

## Install Oh My Zsh
RUNZSH=no KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
## Install OMZ vi motions
git clone https://github.com/b4b4r07/zsh-vimode-visual ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-vimode-visual
git clone https://github.com/nyquase/vi-mode ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/vi-mode
## Install OMZ autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

## Setup a SSH key
ssh-keygen -t ed25519 -C "$SETUP_NAME $NAME *autogen"
eval $(ssh-agent)
ssh-add ~/.ssh/id_ed25519

## Tmux configuration
TPM_DIR="$HOME/.tmux/plugins/tpm"
if [ ! -d "$TPM_DIR" ]; then
  git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
fi

# Reload Tmux configuration if Tmux is running
if command -v tmux &>/dev/null && tmux info &>/dev/null; then
  tmux source-file "$HOME/.tmux.conf"
  echo "Tmux configuration reloaded."
fi

# Install Tmux plugins
$TPM_DIR/bin/install_plugins

# Build tmux-mem-cpu-load
cmake -S ~/.tmux/plugins/tmux-mem-cpu-load -B ~/.tmux/plugins/tmux-mem-cpu-load && \
make -C ~/.tmux/plugins/tmux-mem-cpu-load && \
sudo make -C ~/.tmux/plugins/tmux-mem-cpu-load install

## Git configuration
git config --global user.name "$USER"
git config --global user.email "$SETUP_EMAIL"
git config --global core.editor "vim"

# Change default shell to zsh for the current user
if ! chsh -s "$(which zsh)"; then
  echo "Could not change default shell — please run 'chsh -s $(which zsh)' manually."
fi

echo "Setup complete!"

# Start zsh shell explicitly (this will replace the current shell)
if [ -t 0 ]; then
  exec zsh
fi

