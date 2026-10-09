# NixOS / Dotfiles To-Do

## Table of Contents
- [README](../README.md)
- [About](about.md)
- [Installation](installation.md)
- [Sway](sway.md)
- [Hyprland](./docs/hyprland.md)


---
## Configuration Organization
### Fun
Add CDDA to my flake. Maybe Mango as well, depending on how far behind the nixos packages Mango is. 
### Performance Cleanups 
* Considering Cachy kernel
* Need to set default apps - MIME
* Copy from command output imperatively 
* hyprshaders, finish hypr documentation

### Development Environment / Jobs
* Weather in fastfetch or fetch?
* Generate ./tree.sh @ startup

### Inconsistent UI
* Keep showing workspace if empty but < current workspace
* No brightnessctl
* Astrodark theme for vscode
* Show color for values in editor of choice
* Scroll and mouse speed
* Unfocused window border is inconsistent 
* Defaults? No default term?
* Terminal isn't fallback software -> move to home manager.
* Workspace char padding for large workspaces
* Mako config
### Security

### Documentation
* Installation documentation should be a separate file from the README file.
### Misc
* Enable swaylock
* Add support for cloud storage & mount at boot
* Add server conf
### Environment
* sc for scim, vi for vim and vim for neovim
---

## Desktop Environment / Window Manager Setup

### Tiling
**This Section is Very Inaccurate Currently**
| I will need for MangoWM | Package / tool |
|---|---|
| Wi-Fi GUI | `nm-applet` |
| Bluetooth GUI | `blueman` |
| Display manager | `greetd` / TTY |
| Launcher | `fuzzel` |
| Status bar | `mangobar` |
| Wallpaper | `swaybg` |
| Brightness | `brightnessctl` |
| Idle handling | `swayidle` |
| Screen locking | `swaylock` |
| Audio control | `pavucontrol` |
| File manager (CLI) | `nnn` / other TUI |
| File manager (GUI) | `thunar` |
| Screenshots | `grim` + `slurp` |
| Clipboard | `wl-clipboard` + `wl-clip-persist` + `cliphist` |
| Notifications | `swaync` |
| Authentication agent | `gnome-polkit` |
| Wayland portals | `xdg-desktop-portal` + `xdg-desktop-portal-wlr` |
| Logout / power menu | `wlogout` |
| Terminal | `kitty` |
| Network backend | `NetworkManager` |
| Audio backend | `PipeWire` + `WirePlumber` |
| Secret / keyring service | `gnome-keyring` |
| GTK/Qt theme configuration | stylix |
| Cursor theme | `Adwaita` |
| Night light / gamma | `wlsunset` |

___
<br/>

| I will need for Niri | Package / tool |
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

I would like to add support for MangoWM and Niri also. Because I wrote some of this before I decided to piece it together, it is now incomplete because of various things I have learned. For example, finding a gui greeter/display manager/login manager/whateveryoucallit that doesn't use a border radius is nearly impossible. I want my login screen to match my desktop environment or window management session. So I gave up on gui greeters and found a tui greeter that works with greeted. 


### GNOME Niceties I Miss

---

## Networking / VPN

---

## Future / Exploration

* Make a fastfetch weather widget
* Make a UI tool that automatically populates .nix files from various types of configuration file languages for common tools 
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
See also: implementation.nix for misc stuff to try.