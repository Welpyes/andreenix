# Gruvbox Rice Xfce4

<br><img width="800-" align="center" src="https://github.com/Welpyes/Proot-distro-Arch-Linux/blob/main/.Readme-Resources/Screenshot_2024-11-12_22-16-19.png">

<details>
<summary><h3>Install Instructions</h3></summary>

**NOTE: Be mindful this is not a very simple installation and you might lose your setup**<br>
<br>
clone this repo
```
git clone https://github.com/Welpyes/Proot-distro-Arch-Linux.git
```
copy the **contents** of the file directory to home(make sure it doesnt replace or shit will break)<br>
if possible move the directories one by one in the home folder to avoid breakage
<br>
now install the packages
```
sudo pacman -S feh polybar rofi zsh starship kitty geany neofetch gtk-engine-murrine --noconfirm
```
**OPTIONAL**<br>
install cava using your aur helper
```
paru -S cava
```
then clone this repo(xfce theme)
```
git clone https://github.com/Fausto-Korpsvart/Gruvbox-GTK-Theme
```
cd to the repo
```
cd Gruvbox-GTK-Theme
```
now install it 
```
./install.sh -t all -c all -s compact --tweaks medium black float outline
```
to remove your existing xfce panels what ever way you want<br>
now go to `~/.config/openbox/styles` then run `gruvbox.sh`





</details>
