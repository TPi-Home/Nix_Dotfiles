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
        workspace_back_and_forth = 0,
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
        numlock_by_default = true,
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

    animations = {
        enabled = false,
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

local function focus_direction(direction)
    local workspace = hl.get_active_special_workspace() or hl.get_active_workspace()

    if workspace and workspace.tiled_layout == "scrolling" then
        local directions = {
            h = "focus l",
            j = "focus d",
            k = "focus u",
            l = "focus r",
        }

        hl.dispatch(hl.dsp.layout(directions[direction]))
    else
        local directions = {
            h = "left",
            j = "down",
            k = "up",
            l = "right",
        }

        hl.dispatch(hl.dsp.focus({ direction = directions[direction] }))
    end
end

hl.bind(mod .. " + H", function() focus_direction("h") end)
hl.bind(mod .. " + J", function() focus_direction("j") end)
hl.bind(mod .. " + K", function() focus_direction("k") end)
hl.bind(mod .. " + L", function() focus_direction("l") end)

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
hl.bind(mod .. " + S", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mod .. " + M", hl.dsp.group.toggle())


local function set_layout(layout)
    local workspace = hl.get_active_special_workspace() or hl.get_active_workspace()

    if not workspace then
        return
    end

    if workspace.special then
        hl.workspace_rule({
            workspace = tostring(workspace.name),
            layout = layout,
        })
    else
        hl.workspace_rule({
            workspace = tostring(workspace.id),
            layout = layout,
        })
    end
end

-- Switch the current workspace to a specific layout.
hl.bind(mod .. " + SHIFT + D", function()
    set_layout("dwindle")
end)

hl.bind(mod .. " + SHIFT + M", function()
    set_layout("master")
end)

hl.bind(mod .. " + SHIFT + S", function()
    set_layout("scrolling")
end)

hl.bind(mod .. " + SHIFT + O", function()
    set_layout("monocle")
end)

-- Cycle through the built-in layouts:
-- dwindle -> master -> scrolling -> monocle -> dwindle
hl.bind(mod .. " + TAB", function()
    local layouts = { "dwindle", "master", "scrolling", "monocle" }
    local workspace = hl.get_active_special_workspace() or hl.get_active_workspace()

    if not workspace then
        return
    end

    local next_layout = layouts[1]

    for i = 1, #layouts do
        if layouts[i] == workspace.tiled_layout then
            next_layout = layouts[(i % #layouts) + 1]
            break
        end
    end

    set_layout(next_layout)
end)

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
