# NixOS / Dotfiles To-Do

## Table of Contents
- [README](../README.md)
- [About](about.md)
- [ToDo](todo.md)
- [Sway](sway.md)
---
**This file has turned into documentation of things I have tried as well as ideas I have had in addition to a todo list. I will eventually break it into other documents. I would like to update the directory structure in the readme before I try to tackle breaking this document up.**
## Configuration Organization
* Finish per-machine configurations if/when needed as well as hosts directory in dotfile folder
* Need to finish default nix files used to tie modules together, specifically for:
  1. Audio
  2. WM
* Deployment scripts and documentation scripts
* Revision of network configuration, perhaps per machine
* Add scaling to Chromium, may need to write a wrapper like was done for Unity
* Enable swaylock
* Finish Hyprland and Niri modules
* Harden Systemd
* Add support for cloud storage & mount at boot
* All code should use a C-family/Microsoft-like formatting style where the language permits it
* Increase mouse movement speed

### Wrappers For
---
* Neovim

### UI to Finish
---
* DM:
  * CSS
  * Try TUI if GTK is problematic


## Dot File Documentation
* Directory Structure on README.md needs updated
  * I could use a script for this
  * 
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

I would like to add support for Niri next. Because I wrote some of this before I decided to piece it together, it is now incomplete because of various things I have learned. For example, finding a gui greeter/display manager/login manager/whateveryoucallit that doesn't use a border radius is nearly impossible. I want my login screen to match my desktop environment or window management session. So I gave up on gui greeters and found a tui greeter that works with greeted. 

Upon getting that all set up, `systemd-analyze security --no-pager greetd.service` seemed to indicate that my display manager had way more permissions than was necessary. I then had to sandbox the display manager and test its functionality with different limitations. This makes me want to review the source code, not because I think it is malicious at all, but because I believe there is much to be learned from it. If something breaks, it probably stems from my cap on the permissions granted to greetd, which means that the permissions granted were permissions that were needed. 

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
* Need to abandon gtk/qt theme elements like icon folder that I am not using

## For If I Ever Learn Rust
```
{
  description = "My configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, rust-overlay, ... }: {
    nixosConfigurations = {
      hostname = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix # Your system configuration.
          ({ pkgs, ... }: {
            nixpkgs.overlays = [ rust-overlay.overlays.default ];
            environment.systemPackages = [ pkgs.rust-bin.stable.latest.default ];
          })
        ];
      };
    };
  };
}
```
