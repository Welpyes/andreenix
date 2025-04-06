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

echo ""
echo ""
echo "Disable GeoIP repo by putting a comment(#) on it"
echo "And enable your region's repo (e.g: Taiwan repo)"
echo "For asia its recommended to use the Taiwan repos"
echo ""
read -p "Choose your mirror list. Press Enter to continue"

nano /etc/pacman.d/mirrorlist

pacman -Syy
pacman -Syu
pacman -S sudo --noconfirm

clear
# Insert the username with sudo privileges at line 101, column 0 in /etc/sudoers file
# Create a temporary file
tmpfile=$(mktemp)

# Insert the username with sudo privileges at the desired location
awk -v username="$username" '{
    if (NR == 123) {
        print username " ALL=(ALL:ALL) ALL"
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
    packages="xfce4 feh ImageMagick rhythmbox firefox leafpad viewnior fastfetch"
    
    echo "installing $packages"
else 
    echo "Initializing script"
fi


pacman -S $packages 

clear
echo -e "${LGreen} You can now exit termux by closing it or using this command: ${NC}"
echo "pkill -f termux"

exit 0
