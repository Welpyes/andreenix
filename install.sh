#!/data/data/com.termux/files/usr/bin/bash

termux-change-repo 
pkg upgrade -y
pkg update -y
# 1. Install dependencies
pkg install root-repo tur-repo x11-repo
pkg install ncurses-utils pulseaudio termux-x11-nightly proot-distro -y

# 2. Download binaries and set them up
curl -L "https://github.com/Welpyes/Termux-Pseudo-DM/releases/download/release/dm" -o /data/data/com.termux/files/usr/bin/dm
curl -L "https://github.com/Welpyes/Termux-Pseudo-Bootloader/releases/download/Release/bootloader" -o /data/data/com.termux/files/usr/bin/bootloader
chmod +x /data/data/com.termux/files/usr/bin/dm
chmod +x /data/data/com.termux/files/usr/bin/bootloader

# Create config directory and download boot file
mkdir -p $HOME/.config/bootloader
curl -L "https://raw.githubusercontent.com/Welpyes/Termux-Pseudo-Bootloader/refs/heads/main/boot" -o $HOME/.config/bootloader/boot
chmod +x $HOME/.config/bootloader/boot

# 6. Request user input
clear
echo "This script only supports/tested on Fedora and Arch Linux Proot-distro"
echo "Please provide the following information:"
read -p "Username: " username
read -s -p "Password: " password
echo ""
read -p "Distro title: " distro_title
read -p "Distro proot name: " distro_proot
read -p "Window manager: " window_manager

# 3. Create .dmrc file
cat > $HOME/.dmrc << EOF
username = $username
pwd = $password
cmd = am start --user 0 -n com.termux.x11/com.termux.x11.MainActivity > /dev/null 2>&1
EOF

# 4. Create bootloader.ini
cat > $HOME/.config/bootloader/bootloader.ini << EOF
[selection_title]
distro = $distro_title (aarch64)
root = $distro_proot root shell (fallback)
exit = Turn Off Computer

[selection_cmd]
distro = bash \$HOME/.config/bootloader/boot
root = pd sh $distro_proot
exit = bash -c 'pkill -f termux'
EOF

# 5 & 7. Create proot file with user inputs
cat > $HOME/.config/bootloader/proot << EOF
#!/data/data/com.termux/files/usr/bin/bash

kill -9 \$(pgrep -f "termux.x11") 2>/dev/null

pulseaudio --start --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" --exit-idle-time=-1

# Prepare termux-x11 session
export XDG_RUNTIME_DIR=\${TMPDIR}
termux-x11 :0 >/dev/null &

sleep 3

# am start --user 0 -n com.termux.x11/com.termux.x11.MainActivity > /dev/null 2>&1
sleep 1

proot-distro login $distro_proot --shared-tmp -- /bin/bash -c 'export PULSE_SERVER=127.0.0.1 && export XDG_RUNTIME_DIR=\${TMPDIR} && su - $username -c "env DISPLAY=:0 $window_manager"'

exit 0
EOF
chmod +x $HOME/.config/bootloader/proot
pkg i $distro_proot -y


# 8. Create uninstall script
cat > $HOME/uninstall.sh << EOF
#!/data/data/com.termux/files/usr/bin/bash
rm -f /data/data/com.termux/files/usr/bin/dm
rm -f /data/data/com.termux/files/usr/bin/bootloader
rm -rf $HOME/.config/bootloader
rm -f $HOME/.dmrc
rm -f $HOME/uninstall.sh
pkg remove proot-distro termux-x11-nightly
echo "Uninstallation complete!"
EOF
chmod +x $HOME/uninstall.sh

echo "Installation complete!"
echo "To uninstall, run: bash $HOME/uninstall.sh"
