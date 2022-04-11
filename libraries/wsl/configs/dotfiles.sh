#!/bin/bash

# Setting the paths
$DOTFILES_PATH = "$(pwd)/.dotfiles"

# Copying configuration
sed -i 's+ZSH_THEME="robbyrussell"+ZSH_THEME="agnoster"+g' ~/.zshrc
sed -i 's+plugins=(git)+plugins=(git ssh-agent z tmux zsh-syntax-highlighting themes)+g' ~/.zshrc
cat -v "${$DOTFILES_PATH}/.zshrc" >> ~/.zshrc
cat -v "${$DOTFILES_PATH}/myTmux.config" >> ~/Tmux.config