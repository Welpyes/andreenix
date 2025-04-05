# Fedora + xfce4 Installation 

<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/4/41/Fedora_icon_%282021%29.svg/1280px-Fedora_icon_%282021%29.svg.png" alt="Fedora Logo" width="200"> <img src="https://upload.wikimedia.org/wikipedia/commons/5/5b/Xfce_logo.svg" alt="xfce logo" width="200">

### Note
We're gonna be installing fedora with xfce4 you can definitely choose other desktop environments in fedora you just need to know about the packages you need to install<br>

if you want to see an example(in this case bspwm) see [this gist](https://gist.github.com/Welpyes/dab8b2199148dcaa91e50eab34274d6b)

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
3. Distro title(can be anything you want, i recommend just Fedora 41)
4. Proot-distro(distro you want to install)
   - put in: `fedora` to install fedora
5. Desktop Environment 
   - put in: `startxfce`
<br><br>

**Secondary Script** <br>
You're gonna be logged in to fedora's root shell. <br><br>
set up the timezone first <br><br>
run this command to get your country's address
```sh
tzselect
```
then put your country in this command(e.g: `/usr/share/zoneinfo/Asia/Manila`)
```shell
ln -sf /usr/share/zoneinfo/<SELECTED_ZONE> /etc/localtime
```

now put this command to set up fedora and install the packages you want
```shell
bash <(curl -fsSL https://raw.githubusercontent.com/Welpyes/andreenix/refs/heads/main/fedora/fedora-package.sh)
```
this script will ask for your username and password again. just put the same ones you wrote earlier
