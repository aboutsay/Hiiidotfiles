#    Hiiidotfiles
# 🌟 My Personal Hyprland Rice (From Scratch)

<div align="center">
  <img src="https://img.shields.io/badge/OS-Arch%20Linux-blue?style=for-the-badge&logo=arch-linux&logoColor=white" alt="OS">
  <img src="https://img.shields.io/badge/WM-Hyprland-28a745?style=for-the-badge&logo=hyprland&logoColor=white" alt="WM">
  <img src="https://img.shields.io/badge/Shell-Fish-red?style=for-the-badge&logo=fish&logoColor=white" alt="Shell">
  <img src="https://img.shields.io/badge/Status-Private%20Backup-orange?style=for-the-badge" alt="Status">
</div>

---

## 📸 Screenshots
> *Place your cool screenshots or repository banner here to show off the styling!*
> 
> *Tip: You can upload your image to GitHub and put the link below.*

<div align="center">
  <img src="screenshots/2026-06-05-102850_screenshot.png" alt="Hyprland Setup Overview" width="85%">
  <img src="screenshots/2026-06-05-105026_screenshot.png" alt="sway notification center" width="85%">
  <img src="screenshots/2026-06-05-103100_screenshot.png" alt="you can chose the LIVE wallpaper you want SUPER + L" width="85%">
  <img src="screenshots/2026-06-05-101654_screenshot.png" alt="a simple app launcher for you SUPER + Z" width="85%">
</div>

---

## 🛠️ Tech Stack & Components

Here is the complete list of tools and packages I used to build this minimal and aesthetic environment from scratch:

| Component | Software Used | Description |
| :--- | :--- | :--- |
| **Window Manager** | [Hyprland](https://hyprland.org/) | Dynamic tiling Wayland compositor |
| **Status Bar** | [Waybar](https://github.com/Alexays/Waybar) | Highly customizable Wayland bar |
| **Notification Center** | [SwayNC](https://github.com/ErikReider/SwayNotificationCenter) | Wayland notification daemon |
| **Application Launcher** | [Rofi (Wayland)](https://github.com/lbonn/rofi) | App launcher & dmenu replacement |
| **Terminal Emulator** | [Kitty](https://sw.kovidgoyal.net/kitty/) | Fast, feature-rich, GPU-based terminal |
| **Shell** | [Fish](https://fishshell.com/) | User-friendly and interactive command line |
| **File Manager** | [Nemo](https://github.com/linuxmint/nemo) | Clean and fast desktop file manager |
| **Session Manager** | [Wlogout](https://github.com/ArtsyMacaw/wlogout) | Wayland logout menu |

---

## ⌨️ Keybindings Quick Reference

Here are some of the essential keybindings configured in my `hyprland.conf`:

*   `SUPER` + `T` ➡️ Open Terminal (**Kitty**)
*   `SUPER` + `Q` ➡️ Kill Active Window
*   `SUPER` + `Z` ➡️ Launch Application Menu (**Rofi**)
*   `SUPER` + `E` ➡️ Open File Manager (**Nemo**)
*   `SUPER` + `F` ➡️➡️pen browser (**firefox**)
*   `SUPER` + `SHIFT` + `M` ➡️ Exit Hyprland

---

## 🚀 Installation & Deployment

> ⚠️ **Note to Self:** This repository is currently customized for my laptop hardware configuration.

To replicate this environment on a fresh Arch Linux system, clone this repository into your home directory and link the configuration files:

```bash
# 1. Clone the repository
git clone [https://github.com/aboutsay/Hiiidotfiles.git](https://github.com/aboutsay/Hiiidotfiles.git) ~/Hiii_dotfiles
cd Hiii_dotfiles
chmod +x /scripts/install_S.sh
./Scripts/install_S.sh

# 2. Create target directory if it doesn't exist
mkdir -p ~/.config

# 3. Copy the components

cp -ri ~/Hiii_dotfiles/.config/* ~/.config/
cp -ri ~/Hiii_dotfiles/.zshrc ~/
cp -ri ~/Hiii_dotfiles/Pictures/ ~/
cp -ri ~/Hiii_dotfiles/Scripts/ ~/
cp -ri ~/Hiii_dotfiles/Videos/ ~/
cp -ri ~/Hiii_dotfiles/info.md ~/

#...
