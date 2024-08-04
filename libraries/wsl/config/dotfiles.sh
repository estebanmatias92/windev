#!/bin/bash

# Copying User configuration
echo "Downloading files: .zshrc, .tmux.config"

curl -#fSO "https://gist.githubusercontent.com/estebanmatias92/9f8b1ad34ac9994402149af11cef3338/raw/{.zshrc,.tmux.config}"

echo "Dotfiles were downloaded and copied."
echo ""

sleep 2