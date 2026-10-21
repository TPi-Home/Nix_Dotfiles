# Hyprland Setup

## Table of Contents

- [README](../README.md)
- [About](about.md)
- [ToDo](todo.md)
- [Installation](installation.md)
- [Sway](sway.md)

---

## Overview

Hyprland is an experimental alternative Wayland session alongside Sway. Both are enabled and selectable through greetd/tuigreet.

Hyprland is configured without UWSM. Home Manager's Hyprland systemd integration is disabled because the compositor is launched inside the `wayland-session.scope` user scope.

The configuration is divided into:

- `home/.config/hypr/hyprland.lua`: Shared Hyprland configuration, keybindings, appearance, and startup.
- `home-manager/hyprland/hyprland.nix`: Home Manager integration and cursor environment variables.
- `modules/de/hyprland.nix`: System-level Hyprland configuration.
- `home-manager/kanshi/<host>.nix`: Host-specific display resolution, refresh rate, position, and scaling.
- `home-manager/hosts/<host>.nix`: Host-specific cursor sizes and application scaling.

Hyprland and Sway share Kanshi for display management, eliminating the need for separate Hyprland monitor configurations.

## Session startup and ownership

NixOS manages system services and compositor installation. greetd/tuigreet launches the selected session using:

```sh
systemd-run --user --scope --unit=wayland-session
```

The startup flow is:

```text
greetd
└── tuigreet
    └── systemd-run --user --scope --unit=wayland-session
        └── Hyprland
            ├── Noctalia
            ├── udiskie
            └── Kanshi
```

Hyprland synchronizes the D-Bus activation environment and launches Noctalia, udiskie, and Kanshi from the `hyprland.start` handler.

Kanshi applies the appropriate host-specific display profile, provided the compositor supports the required Wayland output-management protocol.

Home Manager configures the Lua file, cursor, Noctalia, and user applications.

The Hyprland module sets:

```nix
wayland.windowManager.hyprland = {
  enable = true;
  package = null;
  configType = "lua";
  extraConfig = builtins.readFile ../../home/.config/hypr/hyprland.lua;
  systemd.enable = false;
  xwayland.enable = true;
};
```

## Appearance and input

The shared configuration currently uses:

- Dwindle as the initial tiling layout
- Zero inner and outer gaps
- Two-pixel borders: blue active border (`#50A4E9`) and gray inactive border (`#3A3E47`)
- Square corners, no shadows, no blur, and full opacity for active and inactive windows
- Animations enabled
- Num Lock enabled by default
- US keyboard layout and flat pointer acceleration
- Touchpad tap-to-click enabled, natural scrolling disabled, disable-while-typing enabled, and middle-button emulation enabled
- XWayland enabled with `force_zero_scaling = true`

Noctalia owns the wallpaper, bar, launcher, notifications, and desktop controls.

Its host TOML files use paths under `/home/tyler/Nix_Dot_Files`, so update those paths if the checkout is somewhere else.

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

The initial layout is **Dwindle**. The other configured options are Master, Scrolling, and Monocle.

Use the dedicated Super+Shift bindings to choose a layout directly, or Super+Tab to cycle through:

```text
Dwindle → Master → Scrolling → Monocle → Dwindle
```

These are configured in the Lua file. This setup does not depend on a separate layout plugin.

## Display management with Kanshi

Hyprland and Sway share the same host-specific Kanshi configurations.

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

The host-specific Kanshi modules are imported through `flake.nix`.

Hyprland does not define its own host-specific monitor rules. Instead, Kanshi is launched from the shared Lua configuration:

```lua
hl.on("hyprland.start", function()
    hl.exec_cmd("dbus-update-activation-environment --systemd --all")
    hl.exec_cmd("udiskie")
    hl.exec_cmd("noctalia")
    hl.exec_cmd("kanshi")
end)
```

This allows display settings to be shared between both compositors without maintaining duplicate monitor configurations.

### Host-specific display settings

| Host | Monitor | Resolution | Refresh rate | Scale |
|---|---|---|---|---|
| `desktop` | LG Ultragear | 3440×1440 | 160 Hz | 1.0 |
| `laptop` | EDO EF10QBC64.C | 2560×1600 | 165 Hz | 1.25 |
| `generic` | Automatically detected | Compositor default | Compositor default | Not forced |

These values are defined in `home-manager/kanshi/<host>.nix`.

Inspect active monitor settings with:

```sh
hyprctl monitors
```

Kanshi can be started manually for troubleshooting:

```sh
kanshi
```

The active display configuration should reflect the matching Kanshi profile when the compositor supports its output-management protocol.

## Cursor configuration

Cursor sizes are defined through Home Manager rather than separate Hyprland host modules.

The host-specific settings live in:

```text
home-manager/hosts/
├── desktop.nix
├── laptop.nix
└── generic.nix
```

Current cursor sizes:

| Host | Cursor size |
|---|---:|
| `desktop` | 24 |
| `laptop` | 30 |
| `generic` | 36 |

The shared Hyprland Home Manager module derives cursor environment variables from `home.pointerCursor.size`:

```nix
{ config, ... }: {
  home.sessionVariables = {
    XCURSOR_SIZE = toString config.home.pointerCursor.size;
    HYPRCURSOR_SIZE = toString config.home.pointerCursor.size;
  };
}
```

The cursor theme is `Bibata-Modern-Ice`, configured through Home Manager.

Sway retains its host-specific modules because its configuration uses `builtins.replaceStrings` to inject the cursor size into the shared Sway configuration.

This keeps cursor sizes consistent between compositors without duplicating values in Hyprland-specific host files.

## Application and interface scaling

Display scaling, cursor size, Noctalia UI scaling, and application scaling are separate settings.

The configuration separates these responsibilities:

| Setting | Managed by |
|---|---|
| Display resolution and refresh rate | Kanshi |
| Display scaling | Kanshi |
| Cursor theme and size | Home Manager |
| Noctalia UI and bar scaling | Noctalia host configuration |
| Firefox scaling | Home Manager host configuration |
| Vivaldi scaling | Home Manager host configuration |
| Unity Hub scaling | Home Manager host configuration |
| GTK and Qt scaling | Home Manager host configuration |

Noctalia host settings are stored in:

```text
home/.config/noctalia/hosts/
├── desktop.toml
├── laptop.toml
└── generic.toml
```

These allow interface scaling to differ by host independently of the compositor.

## Shared graphical utilities

| Function | Component |
|---|---|
| Display management | Kanshi |
| Bar, launcher, notifications, lock screen, wallpaper, and controls | Noctalia |
| Authentication agent | polkit-gnome |
| Removable-device handling | udiskie |
| Screenshots | grim, slurp, and swappy |
| Clipboard | wl-clipboard |
| Terminal | Ghostty |

These are shared user-level utilities rather than Hyprland-native components.

System services such as NetworkManager, PipeWire/WirePlumber, Bluetooth, power-profiles-daemon, polkit, and XDG portals are managed by NixOS modules.
