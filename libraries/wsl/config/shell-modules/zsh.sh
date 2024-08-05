#!/bin/bash

# Install ZSH and make it default
echo ""
echo "       |=|  Installing Zsh and make it default Shell"
echo ""
sudo apt install -y --no-install-recommends unzip zsh && 
chsh -s $(which zsh)
echo "Zsh shell installed."
echo ""
sleep 1


# Install lsd
echo ""
echo "       |=|  Installing lsd (LS color themes)"
echo ""
$lsd_version="1.1.2"
mkdir ~/downloads
$lsd_binary="~/downloads/lsd_amd64.deb"
curl -#fSLo $lsd_binary https://github.com/lsd-rs/lsd/releases/download/v$lsd_version/lsd-musl_${lsd_version}_amd64.deb
sudo apt install $lsd_binary
rm -f $lsd_binary
echo "lsd installed."
echo ""
sleep 1


# Install fzf
echo ""
echo "       |=|  Installing fzf (Fuzzy Finder)"
echo ""
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
echo "fzf installed."
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


# Install zoxide
echo ""
echo "       |=|  Installing Zoxide (Smarter CD)"
echo ""
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh 
echo "zoxide installed."
echo ""
sleep 1


# Install oh-my-posh
echo ""
echo "       |=|  Installing Oh-My-Posh (PROMPT themes)"
echo ""
curl -s https://ohmyposh.dev/install.sh | bash -s 
echo "oh-my-posh installed."
echo ""
sleep 1


ZSH_CUSTOM_PLUGINS="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins"

# Install zsh-syntax-highlighting
echo ""
echo "       |=|  Installing zsh-syntax-highlighting (Oh-My-Zsh plugin)"
echo ""
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM_PLUGINS}/zsh-syntax-highlighting
echo "zsh-syntax-highlighting installed."
echo ""
sleep 1


# Install zsh-autosuggestions
echo ""
echo "       |=|  Installing zsh-autosuggestions (Oh-My-Zsh plugin)"
echo ""
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM_PLUGINS}/zsh-autosuggestions
echo "zsh-autosuggestions installed."
echo ""
sleep 1


# Install zsh-completions
echo ""
echo "       |=|  Installing zsh-completions (Oh-My-Zsh plugin)"
echo ""
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM_PLUGINS}/zsh-completions
echo "zsh-completions installed."
echo ""
sleep 1


# Update Oh-My-Zsh
echo ""
echo "       |=|  Update Oh-My-Zsh"
echo ""
zsh -i -c 'omz update'
echo ""
sleep 2