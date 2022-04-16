#!/bin/bash

# Creating SSH Keys
echo ""
echo "       |=|  Creating SSH keys"
echo ""
read -p "Enter your github user.email: " email
ssh-keygen -t ed25519 -C "${email}"
echo "SSH key pair was created."
echo ""
sleep 1


# Start the ssh-agent service/deamon
echo ""
echo "       |=|  Starting SSH-AGENT"
echo ""
eval "$(ssh-agent -s)"
echo "The ssh-agent is running."
echo ""
sleep 1


# Add the SSH private key to the ssh-agent
echo ""
echo "       |=|  Adding the private key to the ssh-agent"
echo ""
ssh-add ~/.ssh/id_ed25519
echo "SSH Key added to the agent."
echo ""
sleep 3