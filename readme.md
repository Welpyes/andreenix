# ANDREENIX | Linux on Termux
<div align=center>
  <img src="./logo.png" width="300"></img>
</div>

## Overview
Andreenix is a pretty straightforward installer/script for a non-native proot based desktop solution<br>

This script will guide you with installations of different distros and desktop environments

---

**Note**
<br>
It is recommended to use a fresh Termux install and not a configured one as this may mess up your setup.<br><br>
If you want to install this on a configured Termux system please back up your home folder and important files inside termux just in case things break<br>

**What does this script do?** 
1. installs necessary packages .
2. Helps you setup launch scripts and accounts
3. Installs a (pseudo) Bootloader and Display Manager
4. Guides you on installing a desktop environment while also giving you freedom to pick one yourself

### Applications Download

- **Termux**: A terminal emulator for Android that allows you to run Linux commands on your device.  
  [![Download Termux](https://img.shields.io/badge/Download-Termux-brightgreen?style=for-the-badge&logo=android)](https://github.com/termux/termux-app/releases/) - click to download

- **Termux-X11 (Xserver)**: Required for running graphical applications within Termux, providing a graphical user interface.  
  [![Download Termux-X11](https://img.shields.io/badge/Download-Termux--X11-blue?style=for-the-badge&logo=linux)](https://github.com/termux/termux-x11/releases/tag/nightly) - click to download
  
### Note For Android 12 and above
If You're getting `"[Process completed (signal 9) - press Enter]"` Termux error see this [github repo](https://github.com/agnostic-apollo/Android-Docs/blob/master/en/docs/apps/processes/phantom-cached-and-empty-processes.md#commands-to-disable-phantom-process-killing-and-tldr) and [reddit post](https://www.reddit.com/r/termux/comments/w0ixkp/comment/ighshu6/?utm_source=share&utm_medium=mweb3x&utm_name=mweb3xcss&utm_term=1&utm_content=share_button)

### Requirements
* **Android Version**: `10 and above`
* **Processor**: `Snapdragon 665 is recommended`
* **Ram** : `3gb and above`
* **Storage**: `5gb minimum, 8gb recommended  FREE STORAGE`
---
### installation
choose distro you want
| Fedora (recommended) |  Archlinux |
|--------|--------|
|  <a href="/fedora/readme.md"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/4/41/Fedora_icon_%282021%29.svg/1280px-Fedora_icon_%282021%29.svg.png" alt="Fedora Logo" width="100"></a> |  <a href="/archlinux/readme.md"><img src="https://cdn0.iconfinder.com/data/icons/flat-round-system/512/archlinux-512.png" alt="Arch Logo" width="100"></a> |

#### Hardware Acceleration
For Hardware Acceleration installation and instructions please visit this repository<br>

[LinuxDroidMaster/Hardware-Acceleration.md](https://github.com/LinuxDroidMaster/Termux-Desktops/blob/main/Documentation/HardwareAcceleration.md)

