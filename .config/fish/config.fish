if status is-interactive
    # No greeting
    set fish_greeting

    # Custom sequences for quickshell / end-4 dotfiles
    if test -f ~/.local/state/quickshell/user/generated/terminal/sequences.txt
        cat ~/.local/state/quickshell/user/generated/terminal/sequences.txt
    end

    # Aliases
    alias clear "printf '\033[2J\033[3J\033[1;1H'"
    alias celar "printf '\033[2J\033[3J\033[1;1H'"
    alias claer "printf '\033[2J\033[3J\033[1;1H'"
    alias ls 'eza --icons'
    alias pamcan pacman
    alias q 'qs -c ii'

    # Init Starship prompt (Must be at the end of interactive block)
    starship init fish | source
end

fish_add_path /home/owen2/.spicetify
