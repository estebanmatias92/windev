#!/bin/bash

# Copying configuration
curl -sSL "https://gist.githubusercontent.com/estebanmatias92/9f8b1ad34ac9994402149af11cef3338/raw/.zshrc" | tee ~/.zshrc > /dev/null
curl -sSL "https://gist.githubusercontent.com/estebanmatias92/9f8b1ad34ac9994402149af11cef3338/raw/.tmux.config" >> ~/.zshrc

# Prompting message
echo "File updated: ~/.zshrc"
echo "File updated: ~/.tmux.config"
echo ""

# Opening files to check
code ~/.zshrc ~/.tmux.config
sleep 2