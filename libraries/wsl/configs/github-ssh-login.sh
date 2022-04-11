#!/bin/bash

# Configuring git user data
echo "-----------------------------------"
echo "--- Configuring global git data ---"
echo "-----------------------------------"
echo ""
read -p "Enter your github user.name: " mygitusername
read -p "Enter your github user.email: " mygituseremail
git config --global user.name "${mygitusername}"
git config --global user.email "${mygituseremail}"
git config --global init.defaultBranch main
echo ""
echo "--global config data: "
echo ""
git config --list --show-origin
sleep 3


# Login to Github, save public SSH Key and get the credential token
echo ""
echo "-----------------------------------------------------"
echo "--- Login to Github and saving the ssh public key ---"
echo "-----------------------------------------------------"
echo ""
gh auth login
echo "Github auto login done."
sleep 1