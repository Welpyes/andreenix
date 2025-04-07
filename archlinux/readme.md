# Archlinux + Xfce4 Installation

<a href="/archlinux/readme.md"><img src="https://cdn0.iconfinder.com/data/icons/flat-round-system/512/archlinux-512.png" alt="Arch Logo" width="200"></a> <img src="https://upload.wikimedia.org/wikipedia/commons/5/5b/Xfce_logo.svg" alt="xfce logo" width="200">

### Note
We're gonna be installing Archlinux with xfce4, but you can definitely choose other desktop environments in Arch, you just need to know about the packages you need to install.<br>

if you want to see an example(in this case bspwm) see [this gist](https://gist.github.com/Welpyes/dab8b2199148dcaa91e50eab34274d6b) for fedora

### installation 

> [!WARNING]
> I recommend installing this to a fresh Termux install as this may break your setup. backup stuff if needed.

**Main script install** <br>
boot up termux and execute this command:
```shell
bash <(curl -fsSL https://raw.githubusercontent.com/Welpyes/andreenix/refs/heads/main/install.sh)
```
<br>

it will ask you for:
1. your username 
2. password you want
3. Distro title(can be anything you want, i recommend just Archlinux)
4. Proot-distro(distro you want to install)
   - put in: `archlinux` to install archlinux(dont capitalize)
5. Desktop Environment 
   - put in: `startxfce4`
<br><br>

**Secondary Script** <br>
You're gonna be logged in to archlinux's root shell. <br><br>
set up the timezone first <br><br>
run this command to get your country's address.
```sh
tzselect
```
then put your country in this command(e.g: `/usr/share/zoneinfo/Asia/Manila`).
```shell
ln -sf /usr/share/zoneinfo/<SELECTED_ZONE> /etc/localtime
```
now execute this command to set up archlinux and install the packages.<br><br>
this script will ask for your username and password again. just put the same ones you wrote earlier.

<details>
  <summary><h4>Mirrorlist setup</h4> (click this)</summary>
  
  Disable `GeoIP` because it doesnt work for aarch64 by adding a comment in front of it (add this ->#)  <br><br>
  Then scroll down and uncomment(remove #) in front of the regional repository you want to enable
  
</details>

```shell
bash <(curl -fsSL https://raw.githubusercontent.com/Welpyes/andreenix/refs/heads/main/archlinux/arch-packages.sh)
```
