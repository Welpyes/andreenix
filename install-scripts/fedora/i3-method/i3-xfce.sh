#!/bin/bash

clear
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
    # package installation
    dnf upgrade -y
    dnf install -y xfce4-session xfce4-panel xfce4-settings xfce4-taskmanager xfce4-screenshooter xfce4-dict xfce4-notifyd feh ImageMagick rhythmbox zsh thunar-volman cava kitty neovim fastfetch viewnior thunar libX11-devel libXcomposite-devel libXdamage-devel libXfixes-devel libXrender-devel make gcc git i3
    rpm -e --nodeps xfce-polkit xfwm4 
    # compile and install fastcompmgr
    git clone https://github.com/tycho-kirchner/fastcompmgr
    cd fastcompmgr
    make
    make install
    su "$username" -c "cd ~ && curl -o main-install.sh https://raw.githubusercontent.com/Welpyes/Proot-distro-install-Guide/refs/heads/main/install-scripts/fedora/i3-method/main-install.sh && bash main-install.sh"
fi

