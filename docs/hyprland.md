# Hyprland Setup

## Table of Contents

- [README](../README.md)
- [About](about.md)
- [ToDo](todo.md)
- [Installation](installation.md)
- [Sway](sway.md)

---

## Overview

Hyprland is an experimental alternative Wayland session alongside Sway. Both are enabled and selectable through greetd/tuigreet. Hyprland is configured without UWSM, and Home Manager's Hyprland systemd integration is disabled because the compositor is launched inside the `wayland-session.scope` user scope.

The shared Lua configuration is `home/.config/hypr/hyprland.lua`, loaded by `home-manager/hyprland/hyprland.nix`. System-level setup lives in `modules/de/hyprland.nix`; host-specific monitor and cursor settings live in `home-manager/hyprland/<host>.nix`.

## Session startup and ownership

NixOS manages system services and compositor installation. greetd/tuigreet launches the selected session using:

~~~sh
systemd-run --user --scope --unit=wayland-session
~~~

The startup flow is:

~~~text
greetd
└── tuigreet
    └── systemd-run --user --scope --unit=wayland-session
        └── Hyprland
            ├── Noctalia
            └── udiskie
~~~

Hyprland synchronizes the D-Bus activation environment and launches Noctalia and udiskie from the `hyprland.start` handler. It does **not** launch Kanshi; its monitor rule is applied by the host-specific Hyprland module.

Home Manager configures the Lua file, cursor, Noctalia, and user applications. The Hyprland module sets `package = null`, `configType = "lua"`, `systemd.enable = false`, and `xwayland.enable = true`.

## Appearance and input

The shared config currently uses:

- Master as the initial tiling layout
- Zero inner and outer gaps
- Two-pixel borders: blue active border (`#50A4E9`) and gray inactive border (`#3A3E47`)
- Square corners, no shadows, no blur, and full opacity for active and inactive windows
- Animations enabled
- Num Lock enabled by default
- US keyboard layout and flat pointer acceleration
- Touchpad tap-to-click enabled, natural scrolling disabled, disable-while-typing enabled, and middle-button emulation enabled
- XWayland enabled

Noctalia owns the wallpaper, bar, launcher, notifications, and desktop controls. Its host TOML files use paths under `/home/tyler/Nix_Dot_Files`, so update those paths if the checkout is somewhere else.

## Keybindings

The source of truth is `home/.config/hypr/hyprland.lua`.

| Binding | Action |
|---|---|
| Super+Enter | Open Ghostty |
| Super+D | Toggle the Noctalia launcher |
| Super+Q | Close the focused window |
| Super+H/J/K/L | Focus in the matching direction; scrolling layout uses layout-specific focus directions |
| Super+Shift+H/J/K/L | Move the window left/down/up/right |
| Super+1…0 | Switch to workspaces 1…10 |
| Super+Shift+1…0 | Move the window to workspaces 1…10 without following |
| Super+B | Toggle split |
| Super+V | Toggle pseudo mode |
| Super+F | Toggle fullscreen |
| Super+C | Toggle floating |
| Super+M | Toggle group |
| Super+Shift+D | Set Dwindle layout |
| Super+Shift+M | Set Master layout |
| Super+Shift+S | Set Scrolling layout |
| Super+Shift+O | Set Monocle layout |
| Super+Tab | Cycle Dwindle, Master, Scrolling, and Monocle layouts |
| Super+Shift+C | Reload Hyprland |
| Super+Shift+P | Capture the screen to Swappy |
| Shift+Print | Select a region and capture to Swappy |
| Super+Shift+E | Stop `wayland-session.scope` and end the session |

Media keys adjust volume with `wpctl` and brightness with `brightnessctl`.

## Layouts

The initial layout is Master. The other configured options are Dwindle, Scrolling, and Monocle. Use the dedicated Super+Shift bindings to choose a layout directly, or Super+Tab to cycle through the layouts. These are configured in the Lua file; this setup does not depend on a separate layout plugin.

## Host-specific display scaling and cursors

The monitor rule is defined separately for each host:

| Host | Monitor | Mode | Position | Scale | Cursor size |
|---|---|---|---|---:|---:|
| `desktop` | LG Ultragear | 3440×1440 at 160 Hz | 0,0 | 1.0 | 24 |
| `laptop` | EDO eDP panel | 2560×1600 at 165 Hz | 0,0 | 1.5 | 36 |
| `generic` | No monitor forced | Default compositor behavior | Automatic | Not forced | 36 |

The values live in `home-manager/hyprland/desktop.nix`, `laptop.nix`, and `generic.nix`. The shared Lua file deliberately contains no fixed monitor rule, so it can be reused across the host outputs.

Inspect live monitors with:

~~~sh
hyprctl monitors
~~~

Output scale, cursor size, Noctalia UI scale, and app scale are separate settings. The host-specific Noctalia module configures GTK, Qt, Firefox, Vivaldi, and Unity Hub app scaling. Current Noctalia UI/bar scale is 1.25 on desktop and 1.5 on laptop and generic. These Noctalia settings are in `home/.config/noctalia/hosts/`.

## Shared graphical utilities

| Function | Component |
|---|---|
| Bar, launcher, notifications, lock screen, wallpaper, and controls | Noctalia |
| Authentication agent | polkit-gnome |
| Removable-device handling | udiskie |
| Screenshots | grim, slurp, and swappy |
| Clipboard | wl-clipboard |
| Terminal | Ghostty |

These are shared user-level utilities rather than Hyprland-native components. System services such as NetworkManager, PipeWire/WirePlumber, Bluetooth, power-profiles-daemon, polkit, and XDG portals are managed by NixOS modules.
