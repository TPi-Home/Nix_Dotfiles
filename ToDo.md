# NixOS / Dotfiles To-Do

## Hyperlink these files to README and create a folder for priority and timelines


## High Priority

### Configuration Organization

* I really would like to optimize what is built, as much of this software is not updated very often
* Decide which configurations should be shared between machines/accounts
* Finish per-machine configurations if/when needed as well as hosts directory in dotfile folder

### Wrappers for:

* Neovim

### VSCode: 
* I have themes installed via home manager but I don't have the default set. Perhaps I need to just feed the nix file a json file for this. 

---

## Nix Development Environment

### Project Flakes

* Decide which projects actually need their own flakes
* Add flakes to important/self-contained projects where reproducible development environments are useful
* Don't add flakes solely for the sake of having flakes

### Development Tools

* Try `jj` (Jujutsu)
* Not really a development tool, but `npins` looks interesting 
* Evaluate whether `jj` complements or replaces parts of current Git workflow
* Review language/toolchain management:

  * C/C++
  * C#
  * Rust
  * Python
  * Lua
  * Nix

---

## Desktop / GNOME

### GNOME Configuration

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

## Shell

* Increase context/history size for zsh
* Ctrl + c/v as copy/paste in terminal

---

## Future / Exploration

* Investigate automated dotfile migration tools
* Investigate Home Manager modules/wrappers for commonly used applications
* Investigate `xdg.configFile` / `home.file` for applications without Home Manager modules or extend my backup scripts to include those
* Explore NixOS hardware configuration improvements, such as a hosts folder for different PCs
* Explore declarative Flatpak management?
* Explore declarative GNOME extensions?
* Explore impermanence / separating persistent data from system configuration
* Explore secrets management
* Explore automated rebuilding/updating workflows
