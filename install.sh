#!/data/data/com.termux/files/usr/bin/bash

termux-change-repo 
pkg upgrade -y
pkg update -y
pkg install root-repo tur-repo x11-repo
pkg install ncurses-utils pulseaudio termux-x11-nightly proot-distro yq -y

curl -L "https://github.com/Welpyes/Termux-Pseudo-DM/releases/download/release/dm" -o /data/data/com.termux/files/usr/bin/dm
curl -L "https://github.com/Welpyes/Termux-Pseudo-Bootloader/releases/download/Release/bootloader" -o /data/data/com.termux/files/usr/bin/bootloader
chmod +x /data/data/com.termux/files/usr/bin/dm
chmod +x /data/data/com.termux/files/usr/bin/bootloader

mkdir -p $HOME/.config/bootloader
curl -L "https://raw.githubusercontent.com/Welpyes/Termux-Pseudo-Bootloader/refs/heads/main/boot" -o $HOME/.config/bootloader/boot
chmod +x $HOME/.config/bootloader/boot

clear
echo "This script only supports/tested on Fedora and Arch Linux Proot-distro"
echo "Please provide the following information:"
read -p "Username: " username
read -s -p "Password: " password
echo ""
echo "distro you want to install(recommended: archlinux, fedora)"
read -p "Proot-Distro : " distro_proot
echo ""
echo "Distro display name(e.g: $username's fedora)"
read -p "Distro title: " distro_title
echo ""
echo "startxfce4, bspwm, i3. (Put startxfce4 if you're following the guide)"
read -p "Window manager launch command: " window_manager

# .dmrc file
cat > $HOME/.dmrc << EOF
username = $username
pwd = $password
cmd = am start --user 0 -n com.termux.x11/com.termux.x11.MainActivity > /dev/null 2>&1
EOF

mv $HOME/.bashrc $HOME/.bashrc.bak
cat > $HOME/.bashrc << EOF
clear

env bootloader
EOF

# Create bootloader.ini
cat > $HOME/.config/bootloader/bootloader.yaml << EOF
prompt:
    title: "Boot Menu"
    timeout: 10 
    bold: true
    options: ["login", "fallback", "exit"]

login:
    type: "main.options"
    options: 
        label: "$(distro_title)"
        cmd: "bash $HOME/.config/bootloader/boot"

fallback:
    type: "main.options"
    options: 
        label: "$(distro_proot) Root Shell (fallback)"
        cmd: "pd sh fedora"
        
exit:
    type: "main.options"
    options:
        label: "Shutdown Computer"
        cmd: "pkill -f termux"
EOF

# Create proot file with user inputs
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

pkill -f termux
EOF
chmod +x $HOME/.config/bootloader/proot
pd i $distro_proot


# uninstall script
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

echo "Bootloader, Display Manager and $distro_proot Installation complete!"
echo ""
echo "If you're following the Install Guide please go back to the guide to get the distro setup script"
echo "To uninstall, run: bash $HOME/uninstall.sh"

pd sh $distro_proot
