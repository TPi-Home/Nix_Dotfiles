# NixOS / Dotfiles To-Do

## Table of Contents
- [About](About.md)
- [ToDo](ToDo.md)

**Imperative Implementations**
- [Imperative/What?](imperative/What.md)
- [Imperative/Why?](imperative/Why.md)

---



## High Priority

### Configuration Organization
* Finish per-machine configurations if/when needed as well as hosts directory in dotfile folder

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
    |I would need:|| 
    |---|---|
    | a wireless manager interface | `nm-applet` |
    | a supported display manager |`greetd` or TTY |
    | a launcher ||
    | a status bar ||
    | a wallpaper tool |`hyprpaper`|
    | a power manager|`brightnessctl`|
    

* Document workarounds for missing GNOME conveniences
* Push configuration files for keybinds and tiling in gnome

### GNOME Niceties

* Hardware plug-and-play management / GUI tools
* "Save as root" workflow for VS Code

  * Configure VS Code as the default editor if appropriate but:
  * Ensure there is still a usable editor when booted into a TTY
  * Consider whether `sudoedit` is preferable to running VS Code as root
* Review other GNOME utilities currently relied upon before changing WM/compositor

---

## Networking / VPN

### ProtonVPN CLI

* Track ProtonVPN CLI protocol-selection pull request
* If PR is not merged, determine whether to package/use the patched version I found through Nix, after of course making sure that is permitted 
* If merged, update the Nix package and remove any workaround

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
