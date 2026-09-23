# Sway Setup

## Table of Contents
- [README](../README.md)
- [About](about.md)
- [ToDo](todo.md)
- [Sway](sway.md)

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

**Owns the system**
- Boot and kernel
- Hardware and NVIDIA
- Networking
- Audio / PipeWire
- Bluetooth
- System fonts
- System packages
- Users
- Security / PAM
- Portals
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

**Owns login**
- Login screen
- Session selection
- Starting the selected Wayland session
- Ending the login session

**File**
- `modules/dm/tuigreet.nix`

### Sway

**Owns the graphical session**
- Windows
- Workspaces
- Keybindings
- Input
- Outputs
- Rendering
- XWayland
- Programs explicitly launched by the Sway config

**Files**
- `modules/de/sway.nix` → installs/enables Sway
- `home-manager/sway/sway.nix` → HM integration
- `home/.config/sway/config` → actual Sway configuration

### Home Manager

**Owns user configuration**
- User applications
- User services
- XDG configuration
- Application configuration
- User environment

**Directory**
- `home-manager/`

### `home/.config`

**Owns application configuration directly**

- `sway/` → Sway
- `waybar/` → Waybar
- `fuzzel/` → Fuzzel
- Other `.config/*` → respective application

Home Manager deploys these files. It does not define what the applications themselves do.

### Desktop Utilities

- **Waybar** → status bar
- **Kanshi** → output profiles
- **Fuzzel** → application launcher
- **Mako** → notifications
- **Swayidle** → idle handling
- **Swaylock** → screen locking

Their packages are installed by NixOS; their configuration is primarily managed through Home Manager / `home/.config`.

### Ownership Rule

> NixOS owns the **system**.  
> Home Manager owns the **user environment**.  
> Sway owns the **graphical session**.  
> Individual applications own their **configuration and behavior**.




| Final Sway Stack: | |
  |---|---|
  | a Wi-Fi GUI | `nm-applet` |
  | a Bluetooth GUI | `blueman` |
  | a supported display manager | `greetd` with `tuigreet` |
  | a launcher | `fuzzel` |
  | a status bar | `waybar` |
  | a wallpaper tool | `swaybg` |
  | a power/brightness tool | `brightnessctl` |
  | idle handling | `swayidle` |
  | screen locking | `swaylock` |
  | audio control | `pavucontrol` |
  | a file manager | cli |
  | screenshots | `grim` + `slurp` |
  | clipboard | `wl-clipboard` |
  | notifications | `swaync` |
  | authentication agent | `polkit_gnome` |
  | Wayland portals | `xdg-desktop-portal-hyprland` |
  | a logout/power menu | `wlogout` |
  | a terminal | `kitty` |
  | a network backend | `NetworkManager` |
  | an audio backend | `PipeWire` + `WirePlumber` |
  | a secret/keyring service | `gnome-keyring` |
  |themes |`nwg-look` for gtk and `hyprqt6engine` for qt|
  |cursors|`Adwaita`|
  |file manager| tui|
  |wayland session mgmt|`uwsm`|

### Keybindings
NEEDS WORK

## Wayland Scaling and X11 Support in Sway

### UWSM
---

* `services.dbus.implementation = "broker";` - uwsm default
* `uwsm` 
    * connects the Wayland compositor session to the existing user session infrastructure, which in this case is dbus and systemd 
    * propagates the graphical session environment

### Sway Scaling
---

Enabled with scaling set to 1 for maximum compatibility. This is important for highdpi users to take note of as all scaling is handled per app. Not every app has a way of handling this via a config file that can be declared with home-manager, meaning you may need to write a wrapper for it.

### Display Compatibility
---

I am having Kanshi handle my display management. To get your monitor's display information, run `swaymsg -t get_outputs`. You can then use the information printed to the terminal to manage `kanshi.nix.` I would like to eventually have a script automate this. Kanshi should handle every bit of display management, but I am not 100% sure of this yet.

#### Kanshi Example
---
```
outputs = [
    {
        criteria = "LG Electronics LG ULTRAGEAR 110NTRLAS678";
        mode = "3440x1440@160Hz";
        position = "0,0";
        scale = 1;
    }
];
```
---


### Steam
---

X11 apps can't really be scaled separately from Wayland, so the easiest way I have found to manage scaling with a high dpi display is by keeping the scaling in sway at 1 via `output * scale 1` in the Sway configuration file, then manually scaling the apps and desktop components to the degree I desire.

`xwayland-satellite` can be enabled for an extra x11/gaming compatibility option. Xwayland must first be disabled in the home manager's `sway.nix` file, then xwayland-satellite needs to be enabled in that same file and executed from the Sway config file. 



