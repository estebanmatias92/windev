#!/bin/bash

# Creating SSH Keys
echo "-------------------------"
echo "--- Creating SSH keys ---"
echo "-------------------------"
echo ""
read -p "Enter your github user.email: " mygituseremail
ssh-keygen -t ed25519 -C "${mygituseremail}"
echo ""
echo "SSH key pair was created."
sleep 2


# Start the ssh-agent service/deamon
echo ""
echo "--------------------------"
echo "--- Starting SSH-AGENT ---"
echo "--------------------------"
echo ""
eval "$(ssh-agent -s)"
echo ""
echo "The ssh-agent is running."
sleep 3


# Add the SSH private key to the ssh-agent
echo ""
echo "-----------------------------------------------"
echo "--- Adding the private key to the ssh-agent ---"
echo "-----------------------------------------------"
echo ""
ssh-add ~/.ssh/id_ed25519
echo "SSH Key added to the agent."
sleep 2