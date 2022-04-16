#!/bin/bash

# Configuring git user data
echo ""
echo "       |=|  Configuring global git data"
echo ""
read -p "Enter your github user.name: " username
read -p "Enter your github user.email: " email
git config --global user.name "${username}"
git config --global user.email "${email}"
git config --global init.defaultBranch main
echo ""
echo "--global config data: "
echo ""
git config --list --show-origin
echo ""
sleep 3


# Login to Github, save public SSH Key and get the credential token
echo ""
echo "       |=|  Login to Github and saving the ssh public key"
echo ""
gh auth login
echo "Github auto login done."
echo ""
sleep 1