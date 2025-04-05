#!/bin/bash

LGreen='\033[1;32m'
NC='\033[0m'
LY='\033[1;33m'

read -p "Please enter your username: " username

# Remove any extra space from the username
username="$username"

# Add the user and assign to the wheel group
useradd -m -G wheel $username

# Set the password for the user
passwd $username

# Insert the username with sudo privileges at line 101, column 0 in /etc/sudoers file
# Create a temporary file
tmpfile=$(mktemp)

# Insert the username with sudo privileges at the desired location
awk -v username="$username" '{
    if (NR == 101) {
        print username " ALL=(ALL) ALL"
    }
    print $0
}' /etc/sudoers > "$tmpfile" && mv "$tmpfile" /etc/sudoers

echo "Account created and username with sudo privileges added to /etc/sudoers."

# Package install prompt
echo -e "${LGreen}Leaving it blank will install xfce(minimal) and additional packages ${NC}"

read -p "List The packages you want to be installed: " packages

packages="$packages"

# package listing
if [ "$packages" = "" ]; then
    packages="xfce4-session xfce4-panel xfce4-settings xfwm4 xfce4-taskmanager xfce4-screenshooter xfce4-dict xfce4-notifyd xfce4-clipman-plugin xfce4-weather-plugin xfce4-sensors-plugin feh ImageMagick rhythmbox firefox xfce4-terminal leafpad fastfetch xfdesktop viewnior pcmanfm"
    
    echo "installing $packages"
else 
    echo "Initializing script"
fi

dnf update -y
dnf upgrade -y 
dnf install $packages -y

rpm -e --nodeps xfce-polkit

# dnf install xfce4-session xfce4-panel xfce4-settings xfwm4 xfce4-taskmanager xfce4-screenshooter xfce4-dict xfce4-notifyd xfce4-clipman-plugin xfce4-weather-plugin xfce4-sensors-plugin feh ImageMagick rhythmbox firefox zsh cava kitty geany leafpad fastfetch xfdesktop viewnior pcmanfm  -y


exit 0
