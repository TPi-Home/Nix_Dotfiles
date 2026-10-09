# Hyprland Setup

## Table of Contents

- [README](../README.md)
- [About](about.md)
- [ToDo](todo.md)
- [Installation](installation.md)
- [Sway](sway.md)

---

## Overview

Hyprland is configured as an alternative, experimental Wayland session alongside Sway. Both are enabled in the NixOS and Home Manager module imports, and the session can be selected through `greetd`/`tuigreet`. This documentation describes the configuration present in the repository, not a claim that Hyprland is the default session.

Hyprland uses its Lua configuration at `home/.config/hypr/hyprland.lua`. Home Manager reads that file through `home-manager/hyprland/hyprland.nix`; the system-level module is `modules/de/hyprland.nix`.

## Components of a Hyprland Session

- Hyprland Wayland compositor with XWayland enabled
- D-Bus environment synchronization on compositor startup
- `systemd --user` and the `wayland-session.scope` launched by tuigreet
- XDG desktop portals, including the Hyprland portal
- Waybar, Kanshi, Mako, udiskie, network and Bluetooth tray applets, and swaybg, started from the Hyprland Lua config
- Shared applications and configuration managed through Home Manager

## Session Startup and Ownership

### NixOS

NixOS owns the system-level configuration and dependencies:

- Boot, kernel, hardware, and NVIDIA support
- Networking, PipeWire/audio, Bluetooth, and power services
- Fonts, system packages, users, security/PAM, and D-Bus
- XDG portal infrastructure and `greetd`
- Hyprland installation and runtime dependencies

Relevant files include `modules/system/`, `modules/graphics/`, `modules/audio/`, `modules/packages/`, `modules/users/`, `modules/dm/tuigreet.nix`, and `modules/de/hyprland.nix`.

The system module sets:

- `programs.hyprland.enable = true`
- `programs.hyprland.xwayland.enable = true`
- `programs.hyprland.withUWSM = false`

The session deliberately does not use UWSM.

### greetd / tuigreet

`greetd` provides the login service and `tuigreet` provides the text-based session selector. The selected Wayland session is launched through:

```sh
systemd-run --user --scope --unit=wayland-session
```

The selected compositor runs inside `wayland-session.scope`. This is a systemd user scope, not UWSM and not a systemd service that independently manages the compositor.

### systemd --user

The startup flow is:

```text
greetd
└── tuigreet
    └── systemd-run --user --scope --unit=wayland-session
        └── Hyprland
            ├── Waybar
            ├── Mako
            ├── Kanshi
            ├── udiskie
            ├── nm-applet / blueman
            └── swaybg
```

Hyprland starts the listed utilities in the `hyprland.start` event handler. Kanshi is currently launched directly by the compositor. Its separate systemd user service definition in `home-manager/programs/services/kanshi.nix` is commented out and is not active.

### Home Manager

Home Manager manages the Lua config and user-level graphical setup:

- Hyprland configuration options and Lua config loading
- Waybar's Hyprland-specific workspace config and shared CSS
- Kanshi display profiles
- Fuzzel and wlogout configuration
- User applications, terminal/browser/editor settings, GTK configuration, and Stylix user configuration

Relevant files include `home-manager/hyprland/hyprland.nix`, `home-manager/waybar/waybar.nix`, `home-manager/programs/services/kanshi.nix`, `home/`, and `home/.config/`.

The Home Manager Hyprland module sets `package = null`, `configType = "lua"`, `systemd.enable = false`, and `xwayland.enable = true`. It loads `home/.config/hypr/hyprland.lua` as the extra config.

## Appearance and Input

The current config uses:

- Dwindle as the default layout
- Zero inner and outer gaps
- Two-pixel borders: blue active border (`#50A4E9`) and gray inactive border (`#3A3E47`)
- Square corners, no shadows, no blur, and no window opacity changes
- Animations disabled
- Num Lock enabled by default
- US keyboard layout and flat pointer acceleration
- Touchpad tap-to-click enabled, natural scrolling disabled, disable-while-typing enabled, and middle-button emulation enabled
- Laptop output `eDP-2` at preferred mode, automatic position, and scale 1.0

The config also sets `NIXOS_OZONE_WL=1` for Electron/Chromium-based applications.

## Keybindings

The source of truth is `home/.config/hypr/hyprland.lua`. The main bindings include:

| Binding | Action |
|---|---|
| `Super+Enter` | Open Ghostty |
| `Super+D` | Open Fuzzel |
| `Super+Q` | Close focused window |
| `Super+H/J/K/L` | Focus left/down/up/right; scrolling layout uses its layout-specific focus directions |
| `Super+Shift+H/J/K/L` | Move window left/down/up/right |
| `Super+1..0` | Switch to workspaces 1..10 |
| `Super+Shift+1..0` | Move window to workspaces 1..10 without following |
| `Super+B` | Toggle split |
| `Super+V` | Toggle pseudo mode |
| `Super+F` | Toggle fullscreen |
| `Super+S` | Toggle floating |
| `Super+M` | Toggle group |
| `Super+Shift+D` | Set dwindle layout |
| `Super+Shift+M` | Set master layout |
| `Super+Shift+S` | Set scrolling layout |
| `Super+Shift+O` | Set monocle layout |
| `Super+Tab` | Cycle dwindle, master, scrolling, and monocle layouts |
| `Super+Shift+C` | Reload Hyprland |
| `Super+Shift+E` | Stop `wayland-session.scope` and end the session |

Media keys adjust volume with `wpctl` and brightness with `brightnessctl`. `Super+Shift+P` captures the screen to Swappy; `Shift+Print` selects a region first. `Ctrl+Space` dismisses the current Mako notification.

## Layouts

The config supports Hyprland's built-in layouts via workspace rules:

- **Dwindle:** default layout
- **Master:** master/stacking arrangement
- **Scrolling:** scrolling tiling layout
- **Monocle:** one tiled window at a time

Use `Super+Tab` to cycle through these layouts or the `Super+Shift` bindings above to choose one directly. Layout behavior is configured in the Lua file; this is not an external plugin setup.

## Display and Scaling

Hyprland's explicit monitor rule targets `eDP-2`, using its preferred mode, automatic position, and scale 1. Kanshi is also launched at compositor startup and applies the profiles in `home-manager/programs/services/kanshi.nix`, which currently describe the desktop LG Ultragear at 3440x1440@160 and the laptop panel at 2560x1600@165, both at scale 1.0.

If monitor configuration appears to conflict, check both the explicit `hl.monitor` rule and Kanshi's profiles. Inspect actual output names and supported modes before editing either configuration.

The Hyprland-specific Waybar config is `home/.config/waybar/hyprland.jsonc`; shared styling is in `home/.config/waybar/style.css`.

## Shared Graphical Services

| Function | Component |
|---|---|
| Launcher | `fuzzel` |
| Status bar | `waybar` |
| Notifications | `mako` |
| Wallpaper | `swaybg` |
| Dynamic display profiles | `kanshi` |
| Removable-device management | `udiskie` |
| Wi-Fi tray | `nm-applet` |
| Bluetooth tray | `blueman` |
| Screenshots | `grim`, `slurp`, and `swappy` |
| Clipboard | `wl-clipboard` |
| Audio control | `pavucontrol` |
| Logout / power menu | `wlogout` |

These are shared utilities rather than Hyprland-native components. In this configuration, Hyprland's startup event launches several of them directly.
