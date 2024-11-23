#!/bin/bash

# Prompt the user for their username
read -p "Enter your username (or type 'none' if you dont have one): " username

# Check if the user provided a username
if [ -z "$username" ]; then
    echo "No username provided. Exiting."
    exit 0
fi

# Check if the user typed 'none'
if [ "$username" == "none" ]; then
    # Insert your custom commands here
    curl -o account-creation.sh https://raw.githubusercontent.com/Welpyes/Proot-distro-install-Guide/refs/heads/main/install-scripts/fedora/account-creation.sh
    bash account-creation.sh
    bash i3-xfce.sh
else
    # Log in as the specified user
    echo "Logging in as $username..."
    su "$username" -c "cd ~ && curl -o main-install.sh https://raw.githubusercontent.com/Welpyes/Proot-distro-install-Guide/refs/heads/main/install-scripts/fedora/i3-method/main-install.sh && bash main-install.sh"
fi

