#!/bin/bash

# Install ZSH and make it default
echo ""
echo "       |=|  Installing Zsh and make it default Shell"
echo ""
yes | sudo apt install unzip zsh && 
chsh -s $(which zsh)
echo "Zsh shell installed."
echo ""
sleep 1


# Creating directory for local binaries
echo ""
mkdir -p ~/.local/bin
echo "Directory created: \"~/.local/bin\""
echo ""
sleep 1


# Install Oh-My-Zsh
echo ""
echo "       |=|  Installing Oh-My-Zsh (Plugin Manager)"
echo ""
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
echo "Oh-My-Zsh (Plugin Manager) installed."
echo ""
sleep 1


# Install Zoxide
echo ""
echo "       |=|  Installing Zoxide (Smarter CD)"
echo ""
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh 
echo "Zoxide installed."
echo ""
sleep 1


# Install Zoxide
echo ""
echo "       |=|  Installing Oh-My-Posh (PROMPT themes)"
echo ""
curl -s https://ohmyposh.dev/install.sh | bash -s 
echo "Oh-My-Posh installed."
echo ""
sleep 1


# Install Zsh Syntax Highlighting
echo ""
echo "       |=|  Installing Zsh Syntax Highlighting (Oh-My-Zsh plugin)"
echo ""
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
echo "Zsh Syntax highlighting installed."
echo ""
sleep 1


# Install Zsh AutoSuggestions
echo ""
echo "       |=|  Installing Zsh AutoSuggestions (Oh-My-Zsh plugin)"
echo ""
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
echo "Zsh AutoSuggestions installed."
echo ""
sleep 1


# Install Zsh Completions
echo ""
echo "       |=|  Installing Zsh Completions (Oh-My-Zsh plugin)"
echo ""
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
echo "Zsh Completions installed."
echo ""
sleep 1


# Update Oh-My-Zsh
echo ""
echo "       |=|  Update Oh-My-Zsh"
echo ""
zsh -i -c 'omz update'
echo ""
sleep 2