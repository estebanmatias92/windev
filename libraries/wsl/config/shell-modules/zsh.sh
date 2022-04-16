#!/bin/bash

# Install ZSH and make it default
echo ""
echo "       |=|  Installing Zsh and make it default Shell."
echo ""
yes | sudo apt install zsh && 
chsh -s $(which zsh)
echo "Zsh shell installed."
echo ""
sleep 1


# Install Oh-My-Zsh
echo ""
echo "       |=|  Installing Oh-My-Zsh (Plugin Manager)."
echo ""
# unattended mode install
printf 'y\nexit\n' | sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "Plugin Manager installed."
echo ""
sleep 1


# Install Oh-My-Zsh Syntax plugin

echo ""
echo "       |=|  Installing plugin for syntax highlighting."
echo ""
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
echo "Plugin installed."
echo ""
sleep 1


# Update Oh-My-Zsh
echo ""
echo "       |=|  Update Plugin Manager."
echo ""
zsh -i -c 'omz update'
echo ""
sleep 2