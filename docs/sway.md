# Sway Setup

## Table of Contents

- [README](../README.md)
- [About](about.md)
- [ToDo](todo.md)
- [Installation](installation.md)
- [Hyprland](hyprland.md)
- [Tmux](tmux.md)

---

## Overview

Sway is the primary Wayland window-manager configuration. Hyprland is also available as an experimental alternative session through the greetd/tuigreet selector.

Both compositors use the systemd user scope `wayland-session.scope` without UWSM.

The configuration is divided into:

- `home/.config/sway/config`: Shared Sway configuration, keybindings, appearance, input, and startup.
- `home-manager/sway/sway.nix`: Shared Home Manager Sway module.
- `home-manager/sway/<host>.nix`: Host-specific rendering of the Sway configuration, including cursor-size substitution.
- `modules/de/sway.nix`: System-level Sway configuration.
- `home-manager/kanshi/<host>.nix`: Host-specific display resolution, refresh rate, position, and scaling.
- `home-manager/hosts/<host>.nix`: Host-specific application scaling and cursor settings.

Sway and Hyprland share Kanshi for display management, allowing consistent monitor settings across both compositors.

## Session startup and ownership

### NixOS

NixOS manages system-level configuration and dependencies, including boot, hardware, NVIDIA support, networking, audio, Bluetooth, power services, fonts, users, security, D-Bus, portals, greetd, and Sway installation.

Relevant files live under `modules/`.

### greetd / tuigreet

greetd provides the login service, and tuigreet shows the text-based session selector.

The selected compositor is launched through:

```sh
systemd-run --user --scope --unit=wayland-session
```

This creates a systemd user scope for the graphical session. It is not UWSM and is not a separate systemd service that independently manages Sway's lifecycle.

```text
greetd
└── tuigreet
    └── systemd-run --user --scope --unit=wayland-session
        └── Sway
            ├── Kanshi
            ├── Noctalia
            └── udiskie
```

### Home Manager and Sway

Home Manager manages the Sway configuration, Kanshi profiles, Noctalia settings, cursor configuration, and user applications.

Sway manages:

- Window management and tiling
- Workspaces and focus
- Keyboard and pointer input
- Keybindings
- Window borders and appearance
- Session startup commands

The shared Sway configuration starts the graphical utilities:

```sh
exec dbus-update-activation-environment --systemd --all
exec_always kanshi
exec noctalia
exec udiskie
```

`exec_always kanshi` starts Kanshi when Sway starts and also executes it when the configuration is reloaded.

The auxiliary services and shared user configuration are described in the repository's Home Manager modules and `home/.config/`.

## Appearance and input

The shared Sway configuration currently uses:

- Zero inner and outer gaps
- Three-pixel borders
- Blue focused borders (`#50A4E9`) and gray unfocused borders (`#3A3E47`)
- Smart borders enabled
- Ubuntu Sans 14 as the window font
- Focus follows mouse
- Num Lock enabled
- Flat pointer acceleration
- Touchpad tap-to-click enabled
- Natural scrolling disabled
- Disable-while-typing enabled
- Middle-button emulation enabled
- Bibata-Modern-Ice cursor theme

Noctalia manages the wallpaper, bar, launcher, notifications, lock screen, and desktop controls.

## Auxiliary graphical components

| Function | Component |
|---|---|
| Display management | Kanshi |
| Bar, launcher, notifications, lock screen, wallpaper, and controls | Noctalia |
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
| Super+Alt+H/J/K/L | Resize the focused container |
| Super+Shift+C | Reload Sway config |
| Super+Shift+R | Restart Sway |
| Super+Shift+E | Show the logout prompt |
| Super+Shift+P | Capture the screen to Swappy |
| Shift+Print | Select a region and capture to Swappy |

Media keys adjust volume with `wpctl` and brightness with `brightnessctl`.

## Display management with Kanshi

Sway and Hyprland share the same host-specific Kanshi configurations.

Kanshi manages:

- Monitor identification
- Resolution
- Refresh rate
- Position
- Display scaling

The configurations are stored in:

```text
home-manager/kanshi/
├── desktop.nix
├── laptop.nix
└── generic.nix
```

The appropriate host module is imported through `flake.nix`.

Sway does not hardcode display modes or scaling in its shared configuration. Instead, it launches Kanshi:

```sh
exec_always kanshi
```

Kanshi applies the matching host-specific display profile.

Hyprland can use the same Kanshi profiles when started from its own session configuration and when the required Wayland output-management protocol is supported.

### Host-specific display settings

| Host | Monitor | Resolution | Refresh rate | Scale |
|---|---|---|---|---|
| `desktop` | LG Ultragear | 3440×1440 | 160 Hz | 1.0 |
| `laptop` | EDO EF10QBC64.C | 2560×1600 | 165 Hz | 1.25 |
| `generic` | Automatically detected | Compositor default | Compositor default | Not forced |

The generic host does not assume a particular monitor name, resolution, or refresh rate.

Inspect active display settings with:

```sh
swaymsg -t get_outputs
```

For a concise view of monitor names, resolutions, and scaling:

```sh
swaymsg -t get_outputs -r | jq '.[] | {name, current_mode, scale}'
```

To troubleshoot Kanshi, it can be started manually:

```sh
kanshi
```

Avoid running multiple independent Kanshi instances in the same session.

## Cursor configuration

Cursor sizes are host-specific and managed through Home Manager.

The shared Sway configuration contains a placeholder:

```sh
seat seat0 xcursor_theme Bibata-Modern-Ice @CURSOR_SIZE@
```

The host-specific Sway modules replace `@CURSOR_SIZE@` when Home Manager generates the configuration.

For example, the laptop module uses:

```nix
{
  xdg.configFile."sway/config".text =
    builtins.replaceStrings
      [ "@CURSOR_SIZE@" ]
      [ "30" ]
      (builtins.readFile ../../home/.config/sway/config);
}
```

Current cursor sizes:

| Host | Cursor size |
|---|---:|
| `desktop` | 24 |
| `laptop` | 30 |
| `generic` | 36 |

The cursor theme is `Bibata-Modern-Ice`.

Home Manager also defines cursor settings through `home.pointerCursor`.

Unlike Hyprland, which can derive its cursor environment variables from `home.pointerCursor.size`, Sway uses the rendered configuration file to set its cursor theme and size explicitly.

This is why Sway retains its host-specific modules even though both compositors share Kanshi.

## Application and interface scaling

Display scaling, cursor size, Noctalia UI scaling, and application scaling are separate settings.

The configuration divides these responsibilities:

| Setting | Managed by |
|---|---|
| Display resolution and refresh rate | Kanshi |
| Display scaling | Kanshi |
| Cursor theme and size | Home Manager and Sway |
| Noctalia UI and bar scaling | Noctalia host configuration |
| Firefox scaling | Home Manager host configuration |
| Vivaldi scaling | Home Manager host configuration |
| Unity Hub scaling | Home Manager host configuration |
| GTK and Qt scaling | Home Manager host configuration |

Host-specific application settings are stored in:

```text
home-manager/hosts/
├── desktop.nix
├── laptop.nix
└── generic.nix
```

Noctalia host configurations are stored in:

```text
home/.config/noctalia/hosts/
├── desktop.toml
├── laptop.toml
└── generic.toml
```

Changing the Kanshi output scale does not automatically change application-specific scaling overrides or Noctalia's internal UI settings.

These can be adjusted independently for each host.

## XWayland and games

Sway supports XWayland applications through its configured XWayland integration.

Some XWayland applications may require application-specific scaling adjustments, particularly on high-DPI displays.

An `xwayland-satellite` example is commented out in the shared Sway configuration:

```sh
#exec xwayland-satellite :1
```

It is not enabled by default.

## Configuration responsibilities

The resulting configuration separates shared compositor behavior from host-specific settings.

| Component | Responsibility |
|---|---|
| `home/.config/sway/config` | Shared Sway behavior and keybindings |
| `home-manager/sway/sway.nix` | Shared Sway Home Manager integration |
| `home-manager/sway/<host>.nix` | Render Sway configuration with host cursor size |
| `home-manager/kanshi/<host>.nix` | Shared display profiles for Sway and Hyprland |
| `home-manager/hosts/<host>.nix` | Cursor sizes and application scaling |
| `home-manager/noctalia/<host>.nix` | Select host-specific Noctalia settings |
| `modules/de/sway.nix` | System-level Sway configuration |

This arrangement keeps display settings centralized in Kanshi while preserving compositor-specific configuration where necessary.
