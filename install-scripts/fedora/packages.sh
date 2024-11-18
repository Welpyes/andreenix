#!/bin/bash

LGreen='\033[1;32m'
NC='\033[0m'
LY='\033[1;33m'






clear
# Package install prompt
echo -e "${LGreen}Leaving it blank will install xfce(minimal) and additional packages ${NC}"

echo -e "${LY}To exit the script use ctrl + c ${NC}"

echo "if you list another desktop environment other than xfce, change the 'fedora.sh' launch args to your DE of choice"

echo ""

read -p "List The packages you want to be installed: " packages

packages="$packages"


# package listing
if [ "$packages" = "" ]; then
    packages="xfce4-session xfce4-panel xfce4-settings xfwm4 xfce4-taskmanager xfce4-screenshooter xfce4-dict dunst xfce4-notifyd xfce4-clipman-plugin xfce4-weather-plugin xfce4-sensors-plugin feh ImageMagick rhythmbox firefox zsh polybar thunar-volman cava kitty geany leafpad fastfetch xfdesktop viewnior thunar"
    
    echo "installing $packages"
else 
    echo "Initializing script"
fi

sleep 3

clear
# package check
echo "make sure you have the correct names of the packages or the script will fail and you have to run this again"
echo -e "packages: ${LGreen} $packages ${NC}"
echo ""

# user prompt if to double check
function prompt_user() {
    read -p "Are you sure?(y/n) " sure
    sure="$sure"

    case "$sure" in
        y|Y|yes|Yes)
            # package installation
            echo "Installing Packages..."
            dnf install $packages
            ;;
        *)
            echo "Re-running the script..."
            sleep 2
            bash ~/packages.sh # This re-runs the script
            ;;
    esac
}

prompt_user
