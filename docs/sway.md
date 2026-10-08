# Sway Setup

## Table of Contents
- [README](../README.md)
- [About](about.md)
- [ToDo](todo.md)
- [Installation](installation.md)

## Components of a Sway Session
* Wayland session
* XWayland
* D-Bus session
    * sync environment on startup
* systemd --user
    * Receives Sway environment
* XDG:
    * desktop portals
        * file chooser
        * open url
        * settings
        * secret
        * print
        * notifications
        * remote desktops
        * screen cast/shot
    * MIME/default applications
    * config/data/cache dirs
* GTK
* Qt

## Ownership

### NixOS

**Owns the system-level configuration**
- Boot and kernel
- Hardware and NVIDIA
- Networking
- Audio / PipeWire
- Bluetooth
- System fonts
- System packages
- Users
- Security / PAM
- XDG portals
- greetd
- Sway installation and runtime dependencies

**Files**
- `modules/system/`
- `modules/graphics/`
- `modules/audio/`
- `modules/packages/`
- `modules/users/`
- `modules/dm/`
- `modules/de/sway.nix`

### greetd / tuigreet

**Owns login and session selection**
- Login interface
- Authentication
- Session selection
- Selecting the Wayland session from its `.desktop` entry
- Starting the selected session
- Returning to the login interface after the graphical session exits

**File**
- `modules/dm/tuigreet.nix`

The selected Wayland session is launched by tuigreet through:

    systemd-run --user --scope --unit=wayland-session

greetd / tuigreet therefore starts the graphical session, but it does not manage the lifetime of individual applications within that session.

### systemd --user

**Provides the user service manager and process supervision**

The graphical session is launched inside a systemd user scope:

    systemd --user
    └── wayland-session.scope
        └── Sway

The scope provides a cgroup boundary for the processes launched as part of that command. It is **not a UWSM-style compositor/session manager** and does not mean that systemd owns the complete graphical session lifecycle.

Uncomment out `kanshi.nix` if you want this to be true:
```
The user service manager separately manages graphical-session services such as Kanshi:

    systemd --user
    ├── wayland-session.scope
    │   └── Sway
    │       ├── Waybar
    │       ├── Firefox
    │       └── Kitty
    │
    └── kanshi.service

Kanshi is configured as a Home Manager user service and is attached to `graphical-session.target`:

    graphical-session.target
    └── kanshi.service

This allows Kanshi to start automatically with the graphical session rather than requiring an `exec_always kanshictl reload` in Sway.
```
### Home Manager

**Owns the user-level graphical environment**
- Sway configuration
- Waybar configuration
- Kanshi configuration and user service
- Fuzzel
- wlogout
- User applications
- User environment variables
- User fonts/font configuration
- GTK user configuration
- Stylix user configuration
- Browser configuration
- Terminal configuration
- Editor configuration

**Files**
- `home-manager/`
- `home/`

Home Manager is responsible for configuring the user's graphical environment, while NixOS handles the system-level services and dependencies required to provide it.

### Sway

**Owns the compositor/window-management layer**
- Wayland compositor
- Window management
- Workspaces
- Keybindings
- Input configuration
- Window rules
- Sway-specific output configuration
- Launching Sway-specific processes

Sway does **not** own display profile management. Kanshi handles display configuration.
Actually, it currently does, but that's because I was getting some journalctl errors. I would like to fix this. 

### Kanshi

**Owns dynamic display configuration**
- Detecting connected/disconnected outputs
- Selecting the appropriate output profile
- Applying display modes
- Applying output positions
- Applying output scaling

Kanshi runs as a systemd user service attached to `graphical-session.target`.

### Auxiliary graphical services

These services provide functionality around the compositor rather than being part of Sway itself:

| Function | Component |
|---|---|
| Wi-Fi GUI | `nm-applet` |
| Bluetooth GUI | `blueman` |
| Launcher | `fuzzel` |
| Status bar | `waybar` |
| Wallpaper | `swaybg` |
| Power/brightness | `brightnessctl` |
| Idle handling | `swayidle` |
| Screen locking | `swaylock` |
| Audio control | `pavucontrol` |
| Screenshots | `grim` + `slurp` |
| Clipboard | `wl-clipboard` |
| Notifications | `mako` |
| Authentication agent | `polkit_gnome` |
| Wayland portals | `xdg-desktop-portal-wlr` |
| Logout/power menu | `wlogout` |
| Terminal | `kitty` |
| Display management | `kanshi` |

### System services used by the graphical session

These remain system-level services managed by NixOS:

| Function | Component |
|---|---|
| Network backend | `NetworkManager` |
| Audio backend | `PipeWire` + `WirePlumber` |
| Bluetooth backend | `bluetooth` |
| Power management | `upower` + `power-profiles-daemon` |
| Authentication / authorization | `polkit` |
| Portals | `xdg-desktop-portal` |

### Configuration ownership summary

    NixOS
    ├── Hardware / kernel / NVIDIA
    ├── NetworkManager
    ├── PipeWire / WirePlumber
    ├── Bluetooth
    ├── Power management
    ├── polkit / PAM
    ├── XDG portal infrastructure
    ├── greetd / tuigreet
    └── Sway package + runtime dependencies

    greetd / tuigreet
    └── Starts the selected Wayland session
        └── systemd-run --user --scope --unit=wayland-session
            └── Sway

    systemd --user
    ├── wayland-session.scope
    │   └── Sway
    │
    └── graphical-session.target
        └── kanshi.service

    Home Manager
    ├── Sway configuration
    ├── Waybar
    ├── Kanshi configuration
    ├── Fuzzel
    ├── wlogout
    ├── User applications
    └── User configuration

### Keybindings
* Need scratchpad bindings

## Wayland and Scaling/X11 Support in Sway

### Sway Scaling
---

Enabled with scaling set to 1 for maximum compatibility. This is important for highdpi users to take note of as all scaling is handled per app. Not every app has a way of handling this via a config file that can be declared with home-manager, meaning you may need to write a wrapper for it.

### Display Compatibility
---

I am having Kanshi handle my display management. To get your monitor's display information, run `swaymsg -t get_outputs`. You can then use the information printed to the terminal to manage `kanshi.nix.` I would like to eventually have a script automate this. Kanshi should handle every bit of display management, but I am not 100% sure of this yet.

#### Kanshi Example
---
    outputs = [
        {
            criteria = "LG Electronics LG ULTRAGEAR 110NTRLAS678";
            mode = "3440x1440@160Hz";
            position = "0,0";
            scale = 1;
        }
    ];
---

### Steam
---

X11 apps can't really be scaled separately from Wayland, so the easiest way I have found to manage scaling with a high dpi display is by keeping the scaling in sway at 1 via `output * scale 1` in the Sway configuration file, then manually scaling the apps and desktop components to the degree I desire.

`xwayland-satellite` can be enabled for an extra x11/gaming compatibility option. Xwayland must first be disabled in the home manager's `sway.nix` file, then xwayland-satellite needs to be enabled in that same file and executed from the Sway config file.
