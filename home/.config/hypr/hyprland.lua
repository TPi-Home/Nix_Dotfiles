-- ============================================================================
-- Hyprland
-- ============================================================================

-- ----------------------------------------------------------------------------
-- General
-- ----------------------------------------------------------------------------

local mod = "SUPER"

hl.config({
    general = {
        gaps_in = 0,
        gaps_out = 0,
        border_size = 2,
        col = {
            active_border = 0xff50a4e9,
            inactive_border = 0xff3a3e47,
        },
        layout = "dwindle",
    },

    binds = {
        workspace_back_and_forth = 1,
    },

    decoration = {
        rounding = 0,
        active_opacity = 1.0,
        inactive_opacity = 1.0,
        shadow = {
            enabled = false,
        },
        blur = {
            enabled = false,
        },
    },

    misc = {
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
    },

    input = {
        kb_layout = "us",
        follow_mouse = 1,
        accel_profile = "flat",
        sensitivity = 0.0,
        touchpad = {
            natural_scroll = false,
            tap_to_click = true,
            disable_while_typing = true,
            middle_button_emulation = true,
        },
    },

    dwindle = {
        preserve_split = true,
    },
})

-- ----------------------------------------------------------------------------
-- Monitor
-- ----------------------------------------------------------------------------

hl.monitor({
    output = "eDP-2",
    mode = "preferred",
    position = "auto",
    scale = 1,
})

-- ----------------------------------------------------------------------------
-- Environment
-- ----------------------------------------------------------------------------

hl.env("NIXOS_OZONE_WL", "1")

-- ----------------------------------------------------------------------------
-- Startup
-- ----------------------------------------------------------------------------

hl.on("hyprland.start", function()
    hl.exec_cmd("dbus-update-activation-environment --systemd --all")
    hl.exec_cmd("kanshi")
    hl.exec_cmd("waybar -c ~/.config/waybar/hyprland.jsonc -s ~/.config/waybar/style.css")
    hl.exec_cmd("mako")
    hl.exec_cmd("udiskie")
    hl.exec_cmd("nm-applet")
    hl.exec_cmd("blueman")
    hl.exec_cmd("swaybg -i /home/tyler/Pictures/Hilltopper.png -m fill")
end)

-- ----------------------------------------------------------------------------
-- Applications
-- ----------------------------------------------------------------------------

local terminal = "ghostty"
local menu = "fuzzel"

hl.bind(mod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(mod .. " + D", hl.dsp.exec_cmd(menu))
hl.bind(mod .. " + Q", hl.dsp.window.close())

-- ----------------------------------------------------------------------------
-- Notifications
-- ----------------------------------------------------------------------------

hl.bind("CTRL + SPACE", hl.dsp.exec_cmd("makoctl dismiss"))

-- ----------------------------------------------------------------------------
-- Screenshots
-- ----------------------------------------------------------------------------

hl.bind(mod .. " + SHIFT + P", hl.dsp.exec_cmd("grim - | swappy -f -"))
hl.bind(mod .. " + SHIFT + C", hl.dsp.exec_cmd("hyprctl reload"))
hl.bind("SHIFT + PRINT", hl.dsp.exec_cmd("grim -g \"$(slurp)\" - | swappy -f -"))

-- ----------------------------------------------------------------------------
-- Lock / Logout
-- ----------------------------------------------------------------------------

hl.bind(mod .. " + SHIFT + E", hl.dsp.exec_cmd("systemctl --user stop wayland-session.scope"))

-- ----------------------------------------------------------------------------
-- Focus
-- ----------------------------------------------------------------------------

hl.bind(mod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mod .. " + J", hl.dsp.focus({ direction = "down" }))
hl.bind(mod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mod .. " + L", hl.dsp.focus({ direction = "right" }))

-- ----------------------------------------------------------------------------
-- Move Windows
-- ----------------------------------------------------------------------------

hl.bind(mod .. " + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(mod .. " + SHIFT + J", hl.dsp.window.move({ direction = "down" }))
hl.bind(mod .. " + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(mod .. " + SHIFT + L", hl.dsp.window.move({ direction = "right" }))

-- ----------------------------------------------------------------------------
-- Workspaces
-- ----------------------------------------------------------------------------

for i = 1, 10 do
    local key = i % 10

    hl.bind(
        mod .. " + " .. key,
        hl.dsp.focus({ workspace = i })
    )

    hl.bind(
        mod .. " + SHIFT + " .. key,
        hl.dsp.window.move({ workspace = i })
    )
end

-- ----------------------------------------------------------------------------
-- Layout
-- ----------------------------------------------------------------------------

hl.bind(mod .. " + B", hl.dsp.layout("togglesplit"))
hl.bind(mod .. " + V", hl.dsp.window.pseudo())
hl.bind(mod .. " + F", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind(mod .. " + C", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mod .. " + M", hl.dsp.group.toggle())

-- ----------------------------------------------------------------------------
-- Media
-- ----------------------------------------------------------------------------

hl.bind(
    "XF86AudioRaiseVolume",
    hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"),
    { locked = true, repeating = true }
)

hl.bind(
    "XF86AudioLowerVolume",
    hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
    { locked = true, repeating = true }
)

hl.bind(
    "XF86AudioMute",
    hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
    { locked = true, repeating = true }
)

hl.bind(
    "XF86MonBrightnessUp",
    hl.dsp.exec_cmd("brightnessctl set 5%+"),
    { locked = true, repeating = true }
)

hl.bind(
    "XF86MonBrightnessDown",
    hl.dsp.exec_cmd("brightnessctl set 5%-"),
    { locked = true, repeating = true }
)
