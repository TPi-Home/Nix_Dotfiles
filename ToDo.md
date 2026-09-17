# NixOS / Dotfiles To-Do

## Table of Contents
- [README](README.md)
- [About](About.md)
- [ToDo](ToDo.md)

**Imperative Implementations**
- [Imperative/What?](imperative/What.md)
- [Imperative/Why?](imperative/Why.md)

---



## High Priority

### Configuration Organization
* Finish per-machine configurations if/when needed as well as hosts directory in dotfile folder
* Need to finish default nix files used to tie modules together, specifically for:
  1. Audio
  2. WM

* Attempting the window manager setup is a lot to do in the nix language. To me it makes the most sense to get a clean and stable setup running first, then translate those configuration files into something nix understands, but even that may not be the best for portability. Perhaps there are better solutions? If you have ideas and want to email me, you should be able to find it via the website I have linked. 

### Wrappers for
* Neovim
---

## Nix Development Environment

### Development Tools

* Not really a development tool, but `npins` looks interesting 

---

## Desktop / GNOME

### GNOME Configuration

| Configuration | |
|---|---|
| Manage GNOME settings with Home Manager | `dconf` perhaps could contradict this |
| Manage GTK theme declaratively | `stylix`  or `home-manager` |
| Manage icon theme declaratively | `stylix`  or `home-manager` | 
| Manage cursor theme declaratively | `stylix` or `home-manager` |
| Manage fonts declaratively | `stylix`  or `home-manager` |
| Manage application-specific themes/configuration | `stylix` or `home-manager` | 

### Tiling (Much of this could be managed the Nix way)

* Evaluate Mosaic
* Evaluate whether a tiling WM/compositor is still desirable
* Identify GNOME functionality that would be lost or become awkward with a tiling WM to prepare for that migration if I go that route
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
  |file manager| cli|

| I will need for sway: | |
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
  |file manager| cli|
  
**NOTE: THIS IS A WORK IN PROGRESS**
    
* Document workarounds for missing GNOME conveniences
* Push configuration files for keybinds and tiling in gnome

### GNOME Niceties

* Hardware plug-and-play management / GUI tools
* "Save as root" workflow for VS Code
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
