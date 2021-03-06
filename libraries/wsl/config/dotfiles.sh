#!/bin/bash

# Current file dir
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Setting the paths
DOTFILES_DIR="${SCRIPT_DIR}/.dotfiles"

# Copying configuration
sed -i 's+ZSH_THEME="robbyrussell"+ZSH_THEME="agnoster"+g' ~/.zshrc
sed -i 's+plugins=(git)+plugins=(git ssh-agent z tmux zsh-syntax-highlighting themes)+g' ~/.zshrc
cat -v "${DOTFILES_DIR}/.zshrc" >> ~/.zshrc
cat -v "${DOTFILES_DIR}/.tmux.config" >> ~/.tmux.config

# Prompting message
echo "File updated: ~/.zshrc"
echo "File updated: ~/.tmux.config"
echo ""

# Opening files to check
code ~/.zshrc ~/.tmux.config
sleep 2