-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

--        ██╗  ██╗██╗██╗██╗██████╗  ██████╗ ████████╗
--        ██║  ██║██║██║██║██╔══██╗██╔═══██╗╚══██╔══╝
--        ███████║██║██║██║██║  ██║██║   ██║   ██║
--        ██╔══██║██║██║██║██║  ██║██║   ██║   ██║
--        ██║  ██║██║██║██║██████╔╝╚██████╔╝   ██║
--        ╚═╝  ╚═╝╚═╝╚═╝╚═╝╚═════╝  ╚═════╝    ╚═╝    by hemawari_saga (aboutsay)

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --


-- ######################################################################################
-- hyprland.lua — converted from hyprland.conf (Hyprland 0.55+ Lua config, hl.* API)
-- Original hyprlang config is deprecated since 0.55; this file uses the new hl.* API.
-- Docs: https://wiki.hypr.land/Configuring/ and hl.* Lua reference
-- ######################################################################################

------------------------------------------------------------------
-- MONITORS
------------------------------------------------------------------
hl.monitor({
    output   = "*",
    mode     = "1366x768@60",
    position = "0x0",
    scale    = 1,
})
-- hl.monitor({ output = "", mode = "preferred", position = "auto", scale = 1.5 })

------------------------------------------------------------------
-- PROGRAMS (kept as Lua locals, replacing $terminal / $fileManager / $menu)
------------------------------------------------------------------
local terminal    = "kitty"
local fileManager  = "nemo" -- or dolphin if you're a nerd
local menu         = "rofi"
local mainMod      = "SUPER"

------------------------------------------------------------------
-- AUTOSTART (exec-once -> hl.exec_cmd, runs once when the script loads)
hl.on("hyprland.start", function ()------------------------------------------------------------------
hl.exec_cmd("waybar")
hl.exec_cmd("awww-daemon")
hl.exec_cmd("sh -c 'sleep 1 && awww img ~/Pictures/wallpapers/zero.png'")
hl.exec_cmd("hypridle")
hl.exec_cmd("sh -c 'while true; do ~/.config/hypr/scripts/battery-warn.sh; sleep 60; done'")
hl.exec_cmd("wlsunset -t 3499 -T 3500")
hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
hl.exec_cmd("swaync")
hl.exec_cmd("nm-applet --indicator")
end)
------------------------------------------------------------------
-- ENVIRONMENT VARIABLES
------------------------------------------------------------------
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

------------------------------------------------------------------
-- PERMISSIONS (disabled by default, same as original commented block)
------------------------------------------------------------------
hl.config({ ecosystem = { enforce_permissions = true } })
hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")

------------------------------------------------------------------
-- LOOK AND FEEL
------------------------------------------------------------------
hl.config({
    general = {
        gaps_in     = 5,
        gaps_out    = 9,
        border_size = 2,
        col = {
            active_border   = { colors = {"rgba(d18a06ff)", "rgba(ffffff22)"}, angle = 45 },
            inactive_border = "rgba(595959aa)",
        },
        resize_on_border        = true, -- was false then overridden to true later in your .conf
        allow_tearing           = false,
        layout                  = "dwindle",
        extend_border_grab_area = 20,
        hover_icon_on_border    = true,
    },

    decoration = {
        rounding        = 10,
        rounding_power  = 2,
        active_opacity  = 0.93,
        inactive_opacity = 0.54,
        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = "rgba(1a1a1aee)",
        },
        blur = {
            enabled            = false,
            size               = 1,
            passes             = 3,
            vibrancy           = 0.2,
            new_optimizations  = true,
            ignore_opacity     = true,
        },
    },

    dwindle = {
        preserve_split = true,
    },

    master = {
        new_status = "master",
    },

    misc = {
        force_default_wallpaper  = -1,
        disable_hyprland_logo   = false,
    },

    input = {
        kb_layout   = "us",
        kb_variant  = "",
        kb_model    = "",
        kb_options  = "",
        kb_rules    = "",
        follow_mouse = 1,
        sensitivity  = 0,
        touchpad = {
            natural_scroll = false,
        },
    },
})

------------------------------------------------------------------
-- ANIMATIONS
------------------------------------------------------------------
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1}, {0.32, 1} } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1} } })
hl.curve("linear",         { type = "bezier", points = { {0, 0}, {1, 1} } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5}, {0.75, 1} } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0}, {0.1, 1} } })

hl.animation({ leaf = "global",        enabled = true, speed = 10,  bezier = "easeOutQuint" })
hl.animation({ leaf = "border",        enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn",     enabled = true, speed = 4.1,  bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true, speed = 1.49, bezier = "linear",        style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true, speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true, speed = 1.5,  bezier = "linear",        style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "zoomFactor",    enabled = true, speed = 7,    bezier = "quick" })
hl.animation({ leaf = "workspaces",    enabled = true, speed = 3,    bezier = "quick", style = "slidefade 20%" })
hl.animation({ leaf = "workspacesIn",  enabled = true, speed = 3,    bezier = "quick", style = "slidefade 20%" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 3,    bezier = "quick", style = "slidefade 20%" })

------------------------------------------------------------------
-- GESTURES / DEVICES
------------------------------------------------------------------
hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })

hl.device({ name = "epic-mouse-v1", sensitivity = -0.5 })



------------------------------------------------------------------
-- KEYBINDINGS
------------------------------------------------------------------
hl.bind(mainMod .. "+T", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. "+Q", hl.dsp.window.close())
hl.bind(mainMod .. "+M", hl.dsp.exec_cmd(
    "command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch exit"))
hl.bind(mainMod .. "+E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. "+V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. "+P", hl.dsp.window.pseudo({ action = "toggle" }))
hl.bind(mainMod .. "+J", hl.dsp.layout("togglesplit"))

-- Move focus
hl.bind(mainMod .. "+left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. "+right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. "+up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. "+down",  hl.dsp.focus({ direction = "down" }))

-- Workspaces 1-9 (+ 0 -> 10)
for i = 1, 9 do
    hl.bind(mainMod .. "+" .. i, hl.dsp.focus({ workspace = tostring(i) }))
    hl.bind(mainMod .. "+SHIFT+" .. i, hl.dsp.window.move({ workspace = tostring(i) }))
end
hl.bind(mainMod .. "+0", hl.dsp.focus({ workspace = "10" }))
hl.bind(mainMod .. "+SHIFT+0", hl.dsp.window.move({ workspace = "10" }))

-- Scratchpad
hl.bind(mainMod .. "+S", hl.dsp.workspace.toggle_special())
hl.bind(mainMod .. "+SHIFT+S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through workspaces
hl.bind(mainMod .. "+mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. "+mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move / resize windows with mouse
--hl.bind(mainMod .. "+mouse:272", hl.dsp.window.drag(), { drag = true })
--hl.bind(mainMod .. "+mouse:273", hl.dsp.window.resize(), { drag = true })
-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })



-- Media / brightness keys
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 5%-"), { locked = true, repeating = true })

-- playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

------------------------------------------------------------------
-- CUSTOM BINDS (from your dotfiles)
------------------------------------------------------------------
-- Rofi launcher on releasing the Super key
hl.bind(mainMod .. "+SUPER_L", hl.dsp.exec_cmd("pkill rofi || rofi -show drun -theme gruvbox-dark"), { release = true })

hl.bind(mainMod .. "+F", hl.dsp.exec_cmd("firefox"))
hl.bind(mainMod .. "+W", hl.dsp.exec_cmd("~/.config/hypr/wall.sh"))
hl.bind(mainMod .. "+L", hl.dsp.exec_cmd("pkill rofi || ~/.config/hypr/scripts/LIVE_wallpaper-picker.sh"))
hl.bind(mainMod .. "+O", hl.dsp.exec_cmd("pkill mpvpaper"))

-- Screenshot <3
hl.bind("Print", hl.dsp.exec_cmd("~/.config/hypr/scripts/screenshot.sh"))

-- Notifications (swaync)
hl.bind(mainMod .. "+N", hl.dsp.exec_cmd("swaync-client -t -sw"))


hl.bind(mainMod .. "+R", function()
    if #hl.get_windows({ class = "waypaper" }) > 0 then
        hl.exec_cmd("pkill waypaper")
    else
        hl.exec_cmd("waypaper", { float = true, size = "800 600", center = true })
    end
end)

-- FULL SCREEN MUD
hl.bind("SUPER+G", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))

-- WINDOW RULES
------------------------------------------------------------------
hl.window_rule({
    name           = "suppress-maximize-events",
    match          = { class = ".*" },
    suppress_event = "maximize",
})

hl.window_rule({
    name      = "fix-xwayland-drags",
    match     = { class = "^$", title = "^$", xwayland = true, float = true, fullscreen = false, pin = false },
    no_focus  = true,
})

hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },
    move  = "20 monitor_h-120",
    float = true,
})

hl.window_rule({
    name  = "waypaper-floating",
    match = { class = "^(waypaper)$" },
    float = true,
    size  = "800 600",
    center = true,
})

hl.window_rule({
    name  = "image-veiwer-uwu-floating",
    match = { class = "^(org.gnome.Loupe)$" },
    float = true,
    size  = "800 600",
    center = true,
})

hl.window_rule({
    name  = "wifi",
    match = { class = "^(nm-connection-editor)$" },
    float = true,
    size  = "600 500",
    center = true,
})

hl.window_rule({
    name  = "b",
    match = { class = "^(blueman-manager)$" },
    float = true,
    size  = "600 600",
    center = true,
})

hl.window_rule({
    name  = "the_big_MPV",
    match = { class = "^(mpv)$" },
    float = true,
    size  = "900 600",
    center = true,
})

hl.window_rule({
    name  = "VideoPlayer",
    match = { class = "^(org.gnome.Showtime)$" },
    float = true,
    size  = "900 600",
    center = true,
})

hl.window_rule({
    name  = "picker",
    match = { class = "^(xdg-desktop-portal-gtk)$" },
    float = true,
    size  = "900 700",
    center = true,
})

hl.window_rule({
    name  = "spotify",
    match = { class = "^(Spotify)$" },
    float = true,
    size  = "900 700",
    center = true,
})

hl.window_rule({
    name  = "code",
    match = { class = "^(code-oss)$" },
    float = true,
    size  = "1100 700",
    center = true,
})

hl.window_rule({
    name  = "telegram",
    match = { class = "^(org.telegram.desktop)$" },
    float = true,
    size  = "1200 700",
    center = true,
})


hl.window_rule({
    name  = "STEAAAAM",
    match = { class = "^(steam)$" },
    float = true,
    center = true,
})

hl.window_rule({
    name  = "the-files-manager",
    match = { class = "^(nemo)$" },
    float = true,
    center = true,
})

--hl.window_rule({
--    name  = "OBS",
--    match = { class = "^(com.obsproject.Studio)$" },
--    float = true,
--    center = true,
--})
