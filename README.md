# WinDev
Repeatable windows 10 development environment. Installs and configures all the tools.


### This script will:

#### Install on Windows
- Visual Studio Code
- Git ***(Will Reboot After)***
- Github CLI
- Github Desktop
- WSL Ubuntu 20.04 ***(Reboot)***
- WSL Ubuntu 20.04 *(Manual Configure Step)*
- Powershell 7+
- Windows Terminal Preview
- Docker Desktop ***(Reboot)***
#### Configure on Windows
- Download Pwsh Modules ***(PSReadline, posh-git, posh-sshell, Posh-SSH, oh-my-posh, Terminal-Icons, z)***
- Create SSH Key pair
- Set SSH Github credentials
- Import Custom settings files ***(PowerShell [$profile](https://gist.github.com/estebanmatias92/863bc01532c6e9593de234b8f88b6bd6), Windows Terminal Settings [.json](https://gist.github.com/estebanmatias92/b1bfbf584ca8e18a70f6d46d89c88c27))***
#### Install on WSL Machine
- Linux Updates
- Curl
- Git
- Github CLI
- Visual Studio Code *(Server)*
#### Configure on WSL Machine
- Download/Install Zsh and Zsh modules
- Create SSH Key pair
- Set SSH Github credentials
- Import Custom settings files ([.zshrc](https://github.com/estebanmatias92/windev/blob/f014787d52bd830f824b74b2df3aeaaebadbafba/libraries/wsl/config/.dotfiles/.zshrc), [Tmux.config](https://github.com/estebanmatias92/windev/blob/f014787d52bd830f824b74b2df3aeaaebadbafba/libraries/wsl/config/.dotfiles/Tmux.config))

**IMPORTANT!!! The program will need input from the user in order to proceed with every step, it is not an unattended type of script... yet...**

### Running the script
#### Prerequisites
- First of all, make sure Windows Powershell **ExecutionPolicy** is at least RemoteSigned *(Run this as **Administrator**)*

*`Set-ExecutionPolicy -ExecutionPolicy RemoteSigned`*

- You have to be in the project's root folder to execute the line below

#### Start the program

*`./init.ps1`*