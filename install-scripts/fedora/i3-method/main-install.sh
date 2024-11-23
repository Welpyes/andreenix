#!/bin/bash

cd ~

# package installation
echo "Installing packages"
sudo dnf upgrade -S
sudo dnf install -y xfce4-session xfce4-panel xfce4-settings xfce4-taskmanager xfce4-screenshooter xfce4-dict xfce4-notifyd feh ImageMagick rhythmbox zsh thunar-volman cava kitty neovim fastfetch viewnior thunar libX11-devel libXcomposite-devel libXdamage-devel libXfixes-devel libXrender-devel make gcc git i3

sudo rpm -e --nodeps xfce-polkit xfwm4 

# import basic i3 config
mkdir -p ~/.config/i3
curl -o ~/.config/i3/config https://raw.githubusercontent.com/Welpyes/Proot-distro-install-Guide/refs/heads/main/install-scripts/fedora/i3-method/config

# compile and install fastcompmgr
git clone https://github.com/tycho-kirchner/fastcompmgr
cd fastcompmgr
make
make install


cd ~


# Create the ~/.autostarts directory if it doesn't exist
mkdir -p ~/.autostarts

# Create the script file named innitrc inside ~/.autostarts
SCRIPT_PATH="$HOME/.autostarts/innitrc"

# Make innitrc script
cat << 'EOF' > "$SCRIPT_PATH"
#!/bin/bash

# Directory containing .sh scripts
SCRIPT_DIR="~/.autostarts"

# Loop through all .sh files in the directory and execute them
for script in "$SCRIPT_DIR"/*.sh; do
    if [ -x "$script" ]; then
        echo "Executing $script"
        "$script"
    else
        echo "$script is not executable. Skipping."
    fi
done
EOF

# Make the script executable
chmod +x "$SCRIPT_PATH"

# Create the ~/.config/autostart directory if it doesn't exist
mkdir -p ~/.config/autostart

# Create the innitrc.desktop file inside ~/.config/autostart
DESKTOP_FILE="$HOME/.config/autostart/innitrc.desktop"

# Write the desired content into the .desktop file
cat << 'EOF' > "$DESKTOP_FILE"
[Desktop Entry]
Type=Application
Exec=bash ~/.autostarts/innitrc
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name=Innitrc
Comment=Start Innitrc at login
EOF

# Create the i3-startup.sh file inside ~/.autostarts
STARTUP_SCRIPT="$HOME/.autostarts/i3-startup.sh"

# Write the desired content into the i3-startup.sh file
cat << 'EOF' > "$STARTUP_SCRIPT"
#!/bin/bash

# kills xfce4 panel
killall xfce4-panel

# start i3 and fastcompmgr
i3 &
fastcompmgr &
EOF

# Make the script executable
chmod +x "$STARTUP_SCRIPT"

exit 0
