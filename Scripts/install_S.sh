#!/bin/bash

set -euo pipefail

# ============================================
#   Hyprland Rice - Auto Install Script
#   Arch Linux · yay required
# ============================================

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
RESET='\033[0m'

echo -e "${CYAN}"
echo "  ██╗  ██╗██╗██╗██╗██████╗  ██████╗ ████████╗"
echo "  ██║  ██║██║██║██║██╔══██╗██╔═══██╗╚══██╔══╝"
echo "  ███████║██║██║██║██║  ██║██║   ██║   ██║   "
echo "  ██╔══██║██║██║██║██║  ██║██║   ██║   ██║   "
echo "  ██║  ██║██║██║██║██████╔╝╚██████╔╝   ██║   "
echo "  ╚═╝  ╚═╝╚═╝╚═╝╚═╝╚═════╝  ╚═════╝    ╚═╝    by hemawari_saga"
echo -e "${RESET}"
echo -e "${YELLOW}  Hyprland Rice Installer · Arch Linux${RESET}"
echo "  ======================================"
echo ""

# ── Check yay ──────────────────────────────
if ! command -v yay &> /dev/null; then
    echo -e "${RED}[✗] yay not found. Installing yay first...${RESET}"
    sudo pacman -S --needed git base-devel
    git clone https://aur.archlinux.org/yay.git /tmp/yay
    cd /tmp/yay && makepkg -si --noconfirm
    cd ~ && rm -rf /tmp/yay
    echo -e "${GREEN}[✓] yay installed${RESET}"
else
    echo -e "${GREEN}[✓] yay found${RESET}"
fi

echo ""

# ── Ask to continue ────────────────────────
read -rp "$(echo -e "${YELLOW}  [?] yay is ready. Do you want to continue and install packages? [y/N]: ${RESET}")" confirm
if [[ ! "$confirm" =~ ^[Yy]$ ]]; then
    echo -e "${RED}  [✗] Aborted.${RESET}"
    exit 0
fi

echo ""

# ── Packages ───────────────────────────────

PACMAN_PKGS=(
    hyprlock
    hypridle
    hyprpaper
    glib2
    mpv
    kitty
    rofi
    rofi-wayland
    firefox
    grim
    wlsunset
    ffmpeg
    zsh
    fish
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji 
    noto-fonts-extra
    ttf-victor-mono-nerd
    loupe
    rsync
    hyprpicker
    fastfetch
    wl-clipboard
    bandwhich
    eza
    starship
    blueman
)

AUR_PKGS=(
    waypaper
    nemo
    mpvpaper
    hyprlock
    dolphin
    wlogout
    awww
    swaync
    ttf-monocraft
    papirus-folders-git
    waybar-git
    networkmanager-dmenu-git
)

# ── Show package list ──────────────────────
echo -e "${CYAN}  Packages to install:${RESET}"
echo ""
echo -e "  ${GREEN}Official repo:${RESET} ${PACMAN_PKGS[*]}"
echo -e "  ${YELLOW}AUR:${RESET}           ${AUR_PKGS[*]}"
echo ""
read -rp "$(echo -e "${YELLOW}  [?] Start downloading and installing all packages? [y/N]: ${RESET}")" confirm2
if [[ ! "$confirm2" =~ ^[Yy]$ ]]; then
    echo -e "${RED}  [✗] Aborted.${RESET}"
    exit 0
fi

echo ""

# ── Install Pacman packages ─────────────────
echo -e "${CYAN}[→] Installing official repo packages...${RESET}"
echo ""

for pkg in "${PACMAN_PKGS[@]}"; do
    if pacman -Qq "$pkg" &> /dev/null; then
        echo -e "  ${YELLOW}[~] $pkg already installed, skipping${RESET}"
    else
        echo -e "  ${CYAN}[+] Installing $pkg...${RESET}"
        sudo pacman -S --noconfirm --needed "$pkg" && \
            echo -e "  ${GREEN}[✓] $pkg installed${RESET}" || \
            echo -e "  ${RED}[✗] Failed to install $pkg${RESET}"
    fi
done

echo ""

# ── Install AUR packages ────────────────────
echo -e "${CYAN}[→] Installing AUR packages...${RESET}"
echo ""

for pkg in "${AUR_PKGS[@]}"; do
    if pacman -Qq "$pkg" &> /dev/null; then
        echo -e "  ${YELLOW}[~] $pkg already installed, skipping${RESET}"
    else
        echo -e "  ${CYAN}[+] Installing $pkg...${RESET}"
        yay -S --noconfirm --needed "$pkg" && \
            echo -e "  ${GREEN}[✓] $pkg installed${RESET}" || \
            echo -e "  ${RED}[✗] Failed to install $pkg${RESET}"
    fi
done

echo ""


# ── Install Graphite GTK Theme ──────────────
echo -e "${CYAN}[→] Installing Graphite GTK Theme...${RESET}"
GRAPHITE_TMP=$(mktemp -d)
if git clone --depth 1 https://github.com/vinceliuice/Graphite-gtk-theme.git "$GRAPHITE_TMP/Graphite-gtk-theme" &> /dev/null; then
    pushd "$GRAPHITE_TMP/Graphite-gtk-theme" > /dev/null
    ./install.sh --tweaks black &> /dev/null && \
        echo -e "  ${GREEN}[✓] Graphite GTK Theme installed${RESET}" || \
        echo -e "  ${RED}[✗] Failed to install Graphite GTK Theme${RESET}"
    popd > /dev/null
    rm -rf "$GRAPHITE_TMP"
else
    echo -e "  ${RED}[✗] Failed to clone Graphite GTK Theme repository${RESET}"
fi

# Set default GTK theme in gsettings safely
gsettings set org.gnome.desktop.interface gtk-theme 'Graphite-Dark' 2>/dev/null || true

echo ""


# ── Install & Configure Papirus Icon Theme ──
echo -e "${CYAN}[→] Installing Papirus Icon Theme...${RESET}"

if pacman -Qq papirus-icon-theme &> /dev/null; then
    echo -e "  ${YELLOW}[~] papirus-icon-theme already installed, skipping download${RESET}"
else
    echo -e "  ${CYAN}[+] Installing papirus-icon-theme via pacman...${RESET}"
    sudo pacman -S --noconfirm --needed papirus-icon-theme &> /dev/null && \
        echo -e "  ${GREEN}[✓] papirus-icon-theme installed${RESET}" || \
        echo -e "  ${RED}[✗] Failed to install papirus-icon-theme${RESET}"
fi

# Apply Black color modifier to Papirus-Dark folders
if command -v papirus-folders &> /dev/null; then
    echo -e "  ${CYAN}[+] Setting Papirus folder color to black...${RESET}"
    papirus-folders -C black -t Papirus-Dark &> /dev/null && \
        echo -e "  ${GREEN}[✓] Papirus dark folders configured to black${RESET}" || \
        echo -e "  ${YELLOW}[~] Could not apply papirus-folders customization${RESET}"
else
    echo -e "  ${YELLOW}[~] papirus-folders CLI tool not found, default icons will be used${RESET}"
fi

# Set default icon theme in GTK settings
gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark' 2>/dev/null || true

echo ""

# ── Enable services ─────────────────────────
echo -e "${CYAN}[→] Enabling services...${RESET}"
systemctl --user enable --now swaync 2>/dev/null && \
    echo -e "  ${GREEN}[✓] swaync enabled${RESET}" || \
    echo -e "  ${YELLOW}[~] swaync service not found (may need manual start)${RESET}"

echo ""

#rofi stuff :

sudo mkdir -p /usr/share/rofi/themes/
sudo cp $HOME/Hiii_dotfiles/Scripts/gruvbox-dark.rasi /usr/share/rofi/themes/gruvbox-dark.rasi

#the shell hihii :

chsh -s $(which fish)

#change the gtq font :

gsettings set org.gnome.desktop.interface font-name 'VictorMono Nerd Font 10' 2>/dev/null || echo -e "  ${YELLOW}[~] gsettings not available, skipping${RESET}"

#make nemo able to change the wallpapers :

mkdir -p ~/.local/share/nemo/actions/
touch ~/.local/share/nemo/actions/set-awww.nemo_action
echo "[Nemo Action]
Active=true
Name=Set as Wallpaper (awww)
Comment=Set selected image as wallpaper using awww
Exec=awww img %F --transition-type wipe --transition-duration 1
Selection=s
Extensions=jpg;jpeg;png;gif;webp;
Mimetypes=image/*;" > ~/.local/share/nemo/actions/set-awww.nemo_action

# 2. Create target directory if it doesn't exist

mkdir -p ~/.config
mkdir -p ~/Pictures
mkdir -p ~/Pictures/screenshots
mkdir -p ~/Videos
mkdir -p ~/Scripts

# 3. Copy the components safely

rsync -av ~/Hiii_dotfiles/.config/ ~/.config/
rsync -av ~/Hiii_dotfiles/Pictures/ ~/Pictures/
rsync -av ~/Hiii_dotfiles/Scripts/ ~/Scripts/
rsync -av ~/Hiii_dotfiles/Videos/ ~/Videos/
rsync -av ~/Hiii_dotfiles/.zshrc ~/
rsync -av ~/Hiii_dotfiles/info.md ~/


# ── Done ────────────────────────────────────
echo -e "${GREEN}======================================"
echo -e "  [✓] Installation complete!"
echo -e "======================================${RESET}"
echo ""
echo -e "  ${YELLOW}Next steps:${RESET}"
echo "  1. restart or logout"
echo "  2. edit any config file easly "
echo "  3. 67 "
echo ""
