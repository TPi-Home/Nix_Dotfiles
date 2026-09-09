# NixOS / Dotfiles To-Do

## Hyperlink these files to README and create a folder for priority and timelines

9/9/26: This is a mess and I am going to bed.

## High Priority

### Flakes & Home Manager

* Set up `flake.nix` for the main NixOS configuration
* Generate and commit `flake.lock`
* Use Home Manager as a NixOS module

  * One `nixos-rebuild` command should update both NixOS and Home Manager, saved as a bash script
* Move user-level configuration from `configuration.nix` into Home Manager

  * Zsh
  * Starship
  * Neovim
  * Git
  * Kitty
  * User-specific packages
  * Environment variables
* Move/manage `~/.config` files through Home Manager
* Set up Home Manager management for themes, fonts, icons, cursors, and desktop preferences where possible

### Configuration Organization

* Decide on final repository structure
* Separate system configuration from user configuration
* Decide which configurations should be shared between machines/accounts
* Create per-machine configurations if/when needed as well as hosts directory in dotfile folder
* Avoid unnecessary duplication between hosts

---

## Nix Development Environment

### Dependencies & Packages

* Establish a sane strategy for system-wide packages vs development dependencies
* Keep truly system-wide tools in NixOS configuration
* Use flakes/dev shells for project-specific dependencies
* Set up `shell.nix` files in various project folders — done
* Evaluate whether existing `shell.nix` files should eventually become `flake.nix` dev shells
* Investigate why certain dependencies are awkward as global installs and document the preferred approach

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

* Reproduce current GNOME preferences declaratively
* Manage GNOME settings with Home Manager / `dconf`
* Manage GTK theme declaratively? 
* Manage icon theme declaratively?
* Manage cursor theme declaratively?
* Manage fonts declaratively? - attempted, will likely have to use home manager as opposed to a module
* Manage application-specific themes/configuration

### Tiling

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

* Consider `ls` alias

  * Decide whether `ls -la` is actually preferable to the current behavior
  * Implement through Home Manager/Zsh configuration if desired
* Review existing Zsh configuration and move user-specific settings into Home Manager
* Review shell plugins and completion configuration
* Decide whether shell configuration should be shared across machines
* Increase context/history size for terminal
* Ctrl + c/v as copy/paste in terminal

---

## Future / Exploration

* Investigate automated dotfile migration tools
* Investigate Home Manager modules for commonly used applications
* Investigate `xdg.configFile` / `home.file` for applications without Home Manager modules or extend my backup scripts to include those
* Explore NixOS hardware configuration improvements, such as a hosts folder for different PCs
* Explore declarative Flatpak management?
* Explore declarative GNOME extensions?
* Explore impermanence / separating persistent data from system configuration
* Explore secrets management
* Explore automated rebuilding/updating workflows

---

## Completed

* NixOS installed and running unstable
* Nix command / flakes experimental features enabled
* `shell.nix` files established for various projects
* Basic development environment configured
* NVIDIA configuration
* GNOME configuration
* PipeWire configuration
* Zsh + Starship configured
* Development toolchains installed globally for the time being

## Bugs Encountered:

* Niri was unusable, was more than likely a skill issue
* 
