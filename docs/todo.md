# NixOS / Dotfiles To-Do

## Table of Contents
- [README](../README.md)
- [About](about.md)
- [Installation](installation.md)
- [Sway](sway.md)
- [Hyprland](hyprland.md)


---
## Configuration Organization
### Docs
* host specific wm configs and update documentation then update tree
### Important
* Defaults? No default term? - MIME
### Performance Cleanups 
* Considering Cachy kernel, only with a binary cache I trust
* Copy from command output imperatively 
* hyprshaders, finish hypr documentation
### Development Environment / Jobs
* Weather in fastfetch or fetch?

### Inconsistent UI
* update home mgr and bootloader and install nh
* full screen apps assigned as floating windows need to account for noctalia bar
### Security

### Misc
* Add support for cloud storage & mount at boot, pi zero ftp
### Environment
* Alias: sc for scim, vi for vim and vim for neovim
---

## Desktop Environment / Window Manager Setup

### Tiling
**This Section is Very Inaccurate Currently**
| I will need for MangoWM | Package / tool |
|---|---|
| Wi-Fi GUI | `nm-applet` |
| Bluetooth GUI | `blueman` |
| Display manager | `greetd` / TTY |
| Launcher | `noctalia` |
| Status bar | `noctalia` |
| Wallpaper | `noctalia` |
| Brightness | `brightnessctl` |
| Idle handling | `noctalia` |
| Screen locking | `noctalia` |
| Audio control | `noctalia` |
| File manager (CLI) | `nnn` / other TUI |
| File manager (GUI) | `thunar` |
| Screenshots | `grim` + `slurp` |
| Clipboard | `wl-clipboard` + `noctalia` |
| Notifications | `noctalia` |
| Authentication agent | `gnome-polkit` |
| Wayland portals | `xdg-desktop-portal` + `xdg-desktop-portal-wlr` |
| Logout / power menu | `noctalia` |
| Terminal | `ghostty` |
| Network backend | `NetworkManager` |
| Audio backend | `PipeWire` + `WirePlumber` |
| Secret / keyring service | `gnome-keyring` |
| GTK/Qt theme configuration | stylix |
| Night light / gamma | `wlsunset` |
 |file manager| `thunar`|

___
<br/>

| I will need for Niri | Package / tool |
  |---|---|
  | a Wi-Fi GUI | `noctalia` |
  | a Bluetooth GUI | `noctalia` |
  | a supported display manager | `greetd` or TTY |
  | a launcher | `noctalia` |
  | a status bar | `noctalia` |
  | a wallpaper tool | `noctalia` |
  | a power/brightness tool | `brightnessctl` |
  | idle handling | `noctalia` |
  | screen locking | `noctalia` |
  | audio control | `noctalia` |
  | screenshots | `hyprshot` |
  | clipboard | move `wl-clipboard` from `nvim.nix` to a system module |
  | notifications | `noctalia` |
  | authentication agent | `polkit_gnome` |
  | Wayland portals | `xdg-desktop-portal-hyprland` |
  | a logout/power menu | `noctalia` |
  | a terminal | `ghostty` |
  | a network backend | `NetworkManager` |
  | an audio backend | `PipeWire` + `WirePlumber` |
  | a secret/keyring service | `gnome-keyring` |
  |themes |`nwg-look` for gtk and `hyprqt6engine` for qt, `noctalia`|
  |file manager| `thunar`|

**NOTE: THIS IS A WORK IN PROGRESS**

I would like to add support for MangoWM and Niri also. Because I wrote some of this before I decided to piece it together, it is now incomplete because of various things I have learned. For example, finding a gui greeter/display manager/login manager/whateveryoucallit that doesn't use a border radius is nearly impossible. I want my login screen to match my desktop environment or window management session. So I gave up on gui greeters and found a tui greeter that works with greeted. 

---


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