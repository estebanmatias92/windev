# WinDev

Repeatable windows 10 development environment. Installs and configures all the tools.

### This script will

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

- Download and Install **[Meslo](https://www.programmingfonts.org/#meslo)** and **[Caskaydia Cove](https://www.programmingfonts.org/#cascadia-code)** Fonts
- Download Pwsh Modules ***(posh-git, PSReadline, posh-sshell, Posh-SSH, zoxide, oh-my-posh, Terminal-Icons)***
- Create SSH Key pair
- Set SSH Github credentials
- Import Custom settings files ***([Microsoft.PowerShell_profile.ps1](https://gist.github.com/estebanmatias92/79083d148344f9e565679e6551a65074/#file-microsoft-powershell_profile-ps1), [settings.json (windows terminal)](https://gist.github.com/estebanmatias92/79083d148344f9e565679e6551a65074/#file-terminal-settings-json))***

#### Install on WSL Machine

- Linux Updates
- Curl
- Git
- Github CLI
- Visual Studio Code *(Server)*

#### Configure on WSL Machine

- Download unzip
- Download/Install Zsh and Zsh modules ***(git, ssh-agent, tmux, zsh-syntax-highlighting, zsh-autosuggestions, zsh-completions, zoxide, oh-my-posh, lsd)***
- Create SSH Key pair
- Set SSH Github credentials
- Import Custom settings files ([.zshrc](https://gist.github.com/estebanmatias92/9f8b1ad34ac9994402149af11cef3338/#file-zshrc), [.tmux.config](https://gist.github.com/estebanmatias92/9f8b1ad34ac9994402149af11cef3338/#file-tmux-config))

**IMPORTANT!!! The program will need input from the user in order to proceed with every step, it is not an unattended type of script... yet...**

### Running the script

#### Prerequisites

- First of all this program uses **Winget** (A command line tool) to install everything, so you'll need to have installed the ***App Installer** from the Microsoft Store.*

- Second, make sure Windows Powershell **ExecutionPolicy** is at least RemoteSigned. *(Run this as **Administrator**)*

*`Set-ExecutionPolicy -ExecutionPolicy RemoteSigned`*

- You have to be in the project's root folder to execute the line below

#### Start the program

*`./init.ps1`*

#### Or use one line (to rule them all)

*`Start-Process 'powershell.exe' -Wait -Verb runAs -ArgumentList '-Command Set-ExecutionPolicy -ExecutionPolicy RemoteSigned'; ./init.ps1`*
