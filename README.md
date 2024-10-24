# Proot distro Arch Linux install
<br><img width="300-" align="center" src="https://github.com/Welpyes/dotfiles-windows/blob/18d130b89831024092f5a6c05cc556dd70efd60f/wallpapers/20241018_195232.png">

## Prerequisites

- **Termux**: A terminal emulator for Android that allows you to run Linux commands on your device.  
  [![Download Termux](https://img.shields.io/badge/Download-Termux-brightgreen?style=for-the-badge&logo=android)](https://f-droid.org/repo/com.termux_118.apk) - click to download

- **Termux-X11 (Xserver)**: Required for running graphical applications within Termux, providing a graphical user interface.  
  [![Download Termux-X11](https://img.shields.io/badge/Download-Termux--X11-blue?style=for-the-badge&logo=linux)](https://github.com/ahmad1abbadi/extra/releases/download/apps/termux-x11.apk) - click to download 
# 

### Requirements
* **Android Version**: `10 and above`
* **Processor**: `Snapdragon 665 is recommended`
* **Ram** : `3gb and above`
* **Storage**: `5gb minimum, 8gb recommended`
# 
<details>
<summary><b>Termux-x11(Xserver) Preferences</b></summary>

#### Output  
- Display resolution mode  - Exact 
- Display resolution  - 1920x1080(minimum is 1280x720)
- Stretch to fit display  - Off
- Reseed screen while soft keyboard is open  - Off
- PIP mode  - Off
- Fullscreen on device display  - On
- Force landscape orientation  - On
- Hide display cutout (if any)  - Optional
- Keep Screen On - On

### Pointer
- Touchscreen input mode  - Trackpad  
- Show stylus click options  - Off
- Show mouse click helper overlay  - On
- Capture external mouse when possible  - On
- Transform captured pointer movements  - On  
- Enable tap-to-move for touchpads - Off

### Keyboard
Toggle Keyboard using back key - On
**Everything else is optional**

</details>

<details>
<summary><b>Termux Setup</b></summary>
<br> 
First off all use this to update repos and check for bad ones

```sh
termux-change-repo && pkg upgrade -y
```
![termux-change-repo1](https://github.com/Welpyes/Proot-distro-Arch-Linux/blob/a329f2be169ed71e6e812f926df9d911310c5c81/.Readme-Resources/termux-repos1.jpg)
![termux-change-repo2](https://github.com/Welpyes/Proot-distro-Arch-Linux/blob/a329f2be169ed71e6e812f926df9d911310c5c81/.Readme-Resources/termux-repos2.jpg)


<br> 
###
Installing additional repos

```sh
pkg install root-repo x11-repo tur-repo
```
<br>
Install proot-distro and necessary packages

```sh
pkg install termux-x11-nightly pulseaudio proot-distro wget
```
now thats finished lets move on to **Arch Setup**

</details>
