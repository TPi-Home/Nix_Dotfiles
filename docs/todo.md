# NixOS / Dotfiles To-Do

## Table of Contents
- [README](../README.md)
- [About](about.md)
- [ToDo](todo.md)
- [Sway](sway.md)
---

## Configuration Organization
* Finish per-machine configurations if/when needed as well as hosts directory in dotfile folder
* Need to finish default nix files used to tie modules together, specifically for:
  1. Audio
  2. WM
* Deployment scripts
* Separate Waybar configurations for different window managers
* Add scaling to Chromium, may need to write a wrapper like was done for Unity
* Enable swaylock
* Finish Hyprland and Niri modules

### Wrappers For
* Neovim

### UI to Finish
* DM:
  * CSS
  * Try TUI if GTK is problematic

---

## Nix Development Environment

### Mis Development Tools

* Not really a development tool, but `npins` looks interesting 

### Flake 
* Try Doom Emacs
---

## Desktop Environment / Window Manager Setup

### GNOME Configuration

| Configuration | |
|---|---|
| Manage GNOME settings with Home Manager | `dconf` perhaps could contradict this |
| Manage GTK theme declaratively | `stylix`  or `home-manager` |
| Manage icon theme declaratively | `stylix`  or `home-manager` | 
| Manage cursor theme declaratively | `stylix` or `home-manager` |
| Manage fonts declaratively | `stylix`  or `home-manager` |
| Manage application-specific themes/configuration | `stylix` or `home-manager` | 

### Tiling

| I should have for sway: | |
  |---|---|
  | a Wi-Fi GUI | `nm-applet` |
  | a Bluetooth GUI | `blueman` |
  | a supported display manager | `greetd` or TTY |
  | a launcher | `wofi` / `rofi-wayland` |
  | a status bar | `waybar` |
  | a wallpaper tool | `swaybg` |
  | a power/brightness tool | `brightnessctl` |
  | idle handling | `swayidle` |
  | screen locking | `swaylock` |
  | audio control | `pavucontrol` |
  | a file manager | cli |
  | screenshots | `grim` + `slurp` |
  | clipboard | move `wl-clipboard` from `nvim.nix` to a system module |
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

___
<br/>

| I will need for hyprland: | |
  |---|---|
  | a Wi-Fi GUI | `nm-applet` |
  | a Bluetooth GUI | `blueman` |
  | a supported display manager | `greetd` or TTY |
  | a launcher | `wofi` / `rofi-wayland` |
  | a status bar | `waybar` |
  | a wallpaper tool | `hyprpaper` |
  | a power/brightness tool | `brightnessctl` |
  | idle handling | `hypridle` |
  | screen locking | `hyprlock` |
  | audio control | `pavucontrol` |
  | screenshots | `hyprshot` |
  | clipboard | move `wl-clipboard` from `nvim.nix` to a system module |
  | notifications | `mako` / `swaync` |
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
  |wayland session mgmt|`uwsm` if not built in|

**NOTE: THIS IS A WORK IN PROGRESS**

I would like to add support for Niri next.

### GNOME Niceties I Miss

* Hardware plug-and-play management / GUI tools
* "Save as root" workflow for VS Code - no longer really needed with flakes and NixOS
* Review other GNOME utilities currently relied upon before changing WM/compositor

---

## Networking / VPN

---

## Future / Exploration

* Make a fastfetch weather widget
* Make a UI tool that automatically populates .nix files from various types of configuration file languages for common tools 
* Investigate automated dotfile migration tools
* Investigate Home Manager modules/wrappers for commonly used applications
* Investigate `xdg.configFile` / `home.file` for applications without Home Manager modules or extend my backup scripts to include those
* Explore NixOS hardware configuration improvements, such as a hosts folder for different PCs
* Explore declarative Flatpak management?
* Explore declarative GNOME extensions?
* Explore impermanence / separating persistent data from system configuration
* Explore secrets management
* Explore automated rebuilding/updating workflows
