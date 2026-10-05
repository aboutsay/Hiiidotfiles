# Hiiidotfiles
##  A simple Hyprland x Niri Dotfiles (From Scratch + No quick shell)

<div align="center">
  <img src="https://img.shields.io/badge/OS-Arch%20Linux-orange?style=for-the-badge&logo=arch-linux&logoColor=white" alt="OS">
  <img src="https://img.shields.io/badge/Shell-fish-orange?style=for-the-badge&logo=fish&logoColor=white" alt="Shell">
  <img src="https://img.shields.io/badge/Status-Public%20Backup-orange?style=for-the-badge" alt="Status">
</div>

---

##  Screenshots

## waybar

<div align="center">
  <img src="screenshots/waybar.png" alt="waybar" width="92%">
</div>

## extended look

<div align="center">
  <img src="screenshots/main.png" alt="Hyprland Setup Overview" width="85%">
  <img src="screenshots/overview.png" alt="Yayuuu Overview" width="85%">
  <img src="screenshots/rofi.png" alt="rofi" width="85%">
  <img src="screenshots/gtk.png" alt="nemo gtk themed" width="85%">
  <img src="screenshots/swaync.png" alt="swaync" width="85%">
</div>

---
## New Niri config Besides of Hyprland 

now you can try both hyprland and niri on the same user , using the same tools config . just make sure that you have GDM or any log in menu that u can change between the WMs you want :

<div align="center">
  <img src="screenshots/niri.png" alt="from Niri" width="92%">
</div>


---

##  Keybindings Quick Reference

Here are some of the essential keybindings configured in my `hyprland.lua` or niri cofig file:

*   `SUPER` ➡️ Launch Application Menu (**Rofi**) (`SUPER` + `z` for Niri) 
*   `SUPER` + `escape` ➡️ Open Tthe overview (**overview**)
*   `SUPER` + `T` ➡️ Open Terminal (**Kitty**)
*   `SUPER` + `Q` ➡️ Kill Active Window
*   `SUPER` + `N` ➡️ Open SwayNC (**SwayNC**)
*   `SUPER` + `E` ➡️ Open File Manager (**Nemo**)
*   `SUPER` + `F` ➡️ Open browser (**zen-browser-bin**)

*   `SUPER` + `L` ➡️ Chose a live wallpaper (**mpvpaper**)
*   `SUPER` + `O` ➡️ Kill the live wallpaper
*   `SUPER` + `W` ➡️ Random normal wallpaper (**awww**)

*   `SUPER` + `p` or `V` ➡️ Control the windows size (try it to see what I mean )
---

##  Installation & Deployment

To replicate this environment on a fresh Arch Linux system, clone this repository into your home directory and link the configuration files:

```bash
# 1. download this first

sudo pacman -Syu
sudo pacman -S hyprland kitty

#it prefered to download Gnome in case something happen
# 2. Clone the repository :

git clone https://github.com/aboutsay/Hiiidotfiles.git ~/Hiii_dotfiles


# 3. start installation :

cd Hiii_dotfiles
chmod +x ~/Hiii_dotfiles/Scripts/install_S.sh
./Scripts/install_S.sh


#...
