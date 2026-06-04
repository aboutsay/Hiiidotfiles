#!/bin/bash

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
echo "  ╚═╝  ╚═╝╚═╝╚═╝╚═╝╚═════╝  ╚═════╝   ╚═╝   "
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
    mpv
    kitty
    rofi
    firefox
    grim
    waybar
    wlsunset
    ffmpeg
    zsh
)

AUR_PKGS=(
    nemo
    mpvpaper
    hyprlock
    dolphin
    wlogout
    awww
    swaync
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

# ── Enable services ─────────────────────────
echo -e "${CYAN}[→] Enabling services...${RESET}"
systemctl --user enable --now swaync 2>/dev/null && \
    echo -e "  ${GREEN}[✓] swaync enabled${RESET}" || \
    echo -e "  ${YELLOW}[~] swaync service not found (may need manual start)${RESET}"

echo ""
#rofi stuff
sudo $HOME/Hiii_dotfiles/Scripts/gruvbox-dark.rasi /usr/share/rofi/themes/gruvbox-dark.rasi
#the shell hihii
chsh -s $(which zsh)


# ── Done ────────────────────────────────────
echo -e "${GREEN}======================================"
echo -e "  [✓] Installation complete!"
echo -e "======================================${RESET}"
echo ""
echo -e "  ${YELLOW}Next steps:${RESET}"
echo "  1. Copy your dotfiles to ~/.config/"
echo "  2. make the wallpapers files ready : ~/Pictures/wallpapers and ~/Videos/LIVE_wallpapers"
echo "  3. restart"
echo ""
