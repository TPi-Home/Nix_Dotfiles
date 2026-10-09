# Sway Setup

## Table of Contents

- [README](../README.md)
- [About](about.md)
- [ToDo](todo.md)
- [Installation](installation.md)
- [Hyprland](hyprland.md)

---

## Overview

Sway is the primary window-manager configuration in this repository. Hyprland is also configured as an alternative session; both are available from the `greetd`/`tuigreet` session selector.

Sway's configuration is primarily a regular config file managed by Home Manager:

- `home/.config/sway/config`
- `home-manager/sway/sway.nix`
- `modules/de/sway.nix`

The system-level module installs Sway and its runtime dependencies. Home Manager links the config file and sets Home Manager-specific options.

## Components of a Sway Session

- Wayland session and XWayland
- D-Bus session environment synchronization
- `systemd --user` and the `wayland-session.scope` launched by tuigreet
- XDG desktop portals, MIME/default applications, and user config/data/cache directories
- GTK and Qt support
- Compositor-launched utilities such as Kanshi, Waybar, Mako, and swayidle

## Session Startup and Ownership

### NixOS

NixOS owns system-level configuration and dependencies:

- Boot, kernel, hardware, and NVIDIA support
- Networking, audio/PipeWire, Bluetooth, and power services
- Fonts, system packages, users, security/PAM, and D-Bus
- XDG portal infrastructure and `greetd`
- Sway installation and runtime dependencies

Relevant files include `modules/system/`, `modules/graphics/`, `modules/audio/`, `modules/packages/`, `modules/users/`, `modules/dm/tuigreet.nix`, and `modules/de/sway.nix`.

### greetd / tuigreet

`greetd` provides the login service and `tuigreet` presents the text-based session selector. The selected Wayland session is launched through:

```sh
systemd-run --user --scope --unit=wayland-session
```

The selected compositor runs inside `wayland-session.scope`. The wrapper is a systemd user scope, not UWSM and not a separate systemd service that owns Sway's lifecycle.

### systemd --user

The user service manager provides user services and scopes. The graphical session starts approximately as follows:

```text
greetd
└── tuigreet
    └── systemd-run --user --scope --unit=wayland-session
        └── Sway
            ├── Waybar
            ├── Mako
            ├── Kanshi
            └── other compositor-launched applications
```

Sway starts these utilities from its config. Kanshi is currently launched directly by the compositor. A commented-out service definition remains in `home-manager/programs/services/kanshi.nix` for reconsideration.

### Home Manager

Home Manager owns user-level application and desktop configuration:

- Sway config and Sway-specific options
- Waybar config/style and Kanshi output profiles
- Fuzzel and wlogout config
- User applications, browser and terminal settings, editor settings, GTK configuration, and Stylix user configuration

Relevant files include `home-manager/sway/sway.nix`, `home-manager/waybar/waybar.nix`, `home-manager/programs/services/kanshi.nix`, `home/`, and `home/.config/`.

### Sway

Sway owns compositor behavior: window management, workspaces, keybindings, input settings, window borders, and compositor-specific startup commands. The active config is `home/.config/sway/config`.

### Kanshi

Kanshi applies the display profiles declared in `home-manager/programs/services/kanshi.nix`. At present, Sway launches it with `exec_always kanshi`; this is compositor-managed startup, not the commented-out systemd service. The profiles currently describe the desktop LG Ultragear display and the laptop eDP panel.

## Auxiliary Graphical Components

| Function | Component |
|---|---|
| Wi-Fi tray | `nm-applet` |
| Bluetooth tray | `blueman` |
| Launcher | `fuzzel` |
| Status bar | `waybar` |
| Wallpaper | `swaybg` |
| Idle / display power | `swayidle` |
| Screen locking | `swaylock` package available; lock binding/workflow may need finishing |
| Audio control | `pavucontrol` |
| Screenshots | `grim`, `slurp`, and `swappy` |
| Clipboard | `wl-clipboard` |
| Notifications | `mako` |
| Authentication agent | `polkit-gnome` |
| Logout / power menu | `wlogout` |
| Terminal | `ghostty` |
| Display profiles | `kanshi` |

System services such as NetworkManager, PipeWire/WirePlumber, Bluetooth, UPower, power-profiles-daemon, polkit, and XDG portals are configured at the NixOS level.

## Keybindings

The source of truth is `home/.config/sway/config`. The main bindings include:

| Binding | Action |
|---|---|
| `Super+Enter` | Open Ghostty |
| `Super+D` | Open Fuzzel |
| `Super+Q` | Close focused window |
| `Super+H/J/K/L` | Focus left/down/up/right |
| `Super+Shift+H/J/K/L` | Move window left/down/up/right |
| `Super+1..0` | Switch to workspaces 1..10 |
| `Super+Shift+1..0` | Move window to workspaces 1..10 |
| `Super+B` / `Super+V` | Split horizontally / vertically |
| `Super+M` / `Super+W` | Tabbed / stacking layout |
| `Super+E` | Set split layout |
| `Super+T` | Toggle split orientation |
| `Super+F` | Toggle fullscreen |
| `Super+C` | Toggle floating |
| `Super+Z` | Toggle focus between tiling and floating |
| `Super+Tab` | Switch to the previous workspace |
| `Super+Shift+C` | Reload Sway config |
| `Super+Shift+R` | Restart Sway |
| `Super+Shift+E` | Show logout prompt |

Media keys adjust volume with `wpctl` and brightness with `brightnessctl`. `Super+Shift+P` captures the screen to Swappy; `Shift+Print` selects a region first.

## Wayland Scaling and Display Compatibility

Sway output scaling is set to 1.0 so applications can manage their own scaling where possible. This is especially relevant on high-DPI displays, where Wayland and XWayland applications may respond to scaling settings differently.

Use the following to inspect connected outputs:

```sh
swaymsg -t get_outputs
```

The display profiles live in `home-manager/programs/services/kanshi.nix`. They currently specify 3440x1440 at 160 Hz for the desktop monitor and 2560x1600 at 165 Hz for the laptop panel, both at scale 1.0. Check the actual output name and supported mode on each machine before changing a profile.

The Waybar config used by Sway is `home/.config/waybar/config.jsonc`, and its shared style is `home/.config/waybar/style.css`.

### XWayland and Games

XWayland applications may need application-specific scaling. The repository also has an experimental `xwayland-satellite` path commented out in the Sway config; enabling it requires coordinating the related options in `home-manager/sway/sway.nix`. It is not enabled by default.
