# Sway Setup

## Table of Contents

- [README](../README.md)
- [About](about.md)
- [ToDo](todo.md)
- [Installation](installation.md)
- [Hyprland](hyprland.md)

---

## Overview

Sway is the primary window-manager configuration. Hyprland is also available as an alternative session through the greetd/tuigreet selector. Both use the systemd user scope `wayland-session.scope`; Hyprland is configured without UWSM.

The main Sway configuration is stored in `home/.config/sway/config`. The shared Home Manager Sway module is `home-manager/sway/sway.nix`, and the system-level module is `modules/de/sway.nix`. The selected host's Home Manager module renders the config file by replacing its cursor-size placeholder.

## Session startup and ownership

### NixOS

NixOS manages system-level configuration and dependencies, including boot, hardware, NVIDIA support, networking, audio, Bluetooth, power services, fonts, users, security, D-Bus, portals, greetd, and Sway's installation. Relevant files live under `modules/`.

### greetd / tuigreet

greetd provides the login service and tuigreet shows the text-based session selector. The selected compositor is launched through:

~~~sh
systemd-run --user --scope --unit=wayland-session
~~~

This creates a systemd user scope for the graphical session. It is not UWSM and is not a separate systemd service that independently manages Sway's lifecycle.

~~~text
greetd
└── tuigreet
    └── systemd-run --user --scope --unit=wayland-session
        └── Sway
            ├── Kanshi
            ├── Noctalia
            └── udiskie
~~~

### Home Manager and Sway

Home Manager manages the Sway config, Kanshi profiles, Noctalia settings, cursor configuration, and user applications. Sway owns window management, workspaces, input settings, keybindings, borders, and startup commands. The session startup commands in the config include D-Bus environment synchronization, Kanshi, Noctalia, and udiskie.

The auxiliary services and shared user configuration are described in the repository's Home Manager modules and `home/.config/`.

## Auxiliary graphical components

| Function | Component |
|---|---|
| Bar, launcher, notifications, lock screen, wallpaper, and controls | Noctalia |
| Output profile management | Kanshi |
| Authentication agent | polkit-gnome |
| Terminal | Ghostty |
| Screenshots | grim, slurp, and swappy |
| Clipboard | wl-clipboard |
| Removable-device handling | udiskie |

NetworkManager, PipeWire/WirePlumber, Bluetooth, UPower, power-profiles-daemon, polkit, and XDG portals are configured at the NixOS level.

## Keybindings

The source of truth is `home/.config/sway/config`.

| Binding | Action |
|---|---|
| Super+Enter | Open Ghostty |
| Super+D | Toggle the Noctalia launcher |
| Super+Q | Close focused window |
| Super+H/J/K/L | Focus left/down/up/right |
| Super+Shift+H/J/K/L | Move window left/down/up/right |
| Super+1…0 | Switch to workspaces 1…10 |
| Super+Shift+1…0 | Move the focused container to workspaces 1…10 |
| Super+B / Super+V | Split horizontally / vertically |
| Super+M / Super+W | Tabbed / stacking layout |
| Super+E | Set split layout |
| Super+T | Toggle split orientation |
| Super+F | Toggle fullscreen |
| Super+C | Toggle floating |
| Super+Z | Toggle focus between tiling and floating |
| Super+Tab | Switch to the previous workspace |
| Super+Shift+C | Reload Sway config |
| Super+Shift+R | Restart Sway |
| Super+Shift+E | Show the logout prompt |

Media keys adjust volume with `wpctl` and brightness with `brightnessctl`. Super+Shift+P captures the screen to Swappy; Shift+Print selects a region first.

## Host-specific display scaling and cursors

Host settings are split by responsibility:

- `home-manager/kanshi/desktop.nix` sets the desktop output to 3440×1440 at 160 Hz, position 0,0, scale 1.0.
- `home-manager/kanshi/laptop.nix` sets the laptop panel to 2560×1600 at 165 Hz, position 0,0, scale 1.5.
- `home-manager/kanshi/generic.nix` does not assume an output name or mode.
- `home-manager/sway/<host>.nix` sets the pointer-cursor size and substitutes the same value into the Sway config: 24 for desktop, 30 for laptop and generic.
- Sway runs `exec_always kanshi`; the output profile is configured in the host-specific Kanshi file, not in the base Sway config.

Inspect detected outputs on the current session with:

~~~sh
swaymsg -t get_outputs
~~~

Output scale and application scale are independent. The host-specific Noctalia Home Manager modules set app-specific values for GTK, Qt, Firefox, Vivaldi, and Unity Hub. Noctalia also has its own UI/bar settings: the desktop TOML currently uses 1.25, while laptop and generic use 1.5. Do not assume that changing the Sway/Kanshi scale changes every application or the Noctalia shell.

### XWayland and games

XWayland applications may require application-specific scaling. An `xwayland-satellite` example is commented out in the Sway config and is not enabled by default.
