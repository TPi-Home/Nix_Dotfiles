# About

## Table of Contents
- [README](../README.md)
- [ToDo](todo.md)
- [Installation](installation.md)
- [Sway](sway.md)
- [Hyprland](./docs/hyprland.md)

---

## This Project
This repository contains my personal NixOS configuration and dotfiles.

The goal is to keep my system configuration **declarative, reproducible, organized, and easy to maintain** across multiple machines.

## Philosophy and Separation of Responsibilities

### Philosophy

To understand my thinking with this configuration, I want apps that most people need to have a basic functional PC to be handled system wide while user specific software and configs were handled with and owned by home-manager. Most notably, I don't see a good reason to allow GUI applications to be installed system wide unless it is essential for a wayland window manager/display manager session. 

For most situations, home manager having a nix file that points to a config file is the easiest way I have found to avoid my fighting with NixOS. Extra config being assigned by nix in nix lang is not somehow superior to just pointing nix to a config file in my opinion.

### Separation of Responsibilities
The configuration is split into reusable pieces so that machine-specific settings, system functionality, and user configuration remain separate. 


| Directory | Purpose |
|---|---|
| `hosts/` | Machine-specific configuration (desktop, laptop, etc.) |
| `modules/` | Reusable NixOS system-level configuration blocks |
| `home-manager/` | User-level programs and their NixOS integration |
| `home/.config/` | Actual application configuration files (dotfiles) |
| `scripts/` | Convenience scripts for system management |
| `docs/` | Detailed documentation on specific topics |
| `reference/` | Assets and reference material |

## Goals

- Reproducible NixOS installations
- Shared configuration across machines
- Declarative system and user configuration
- Minimal duplication
- Easy rollbacks and recovery
- Version-controlled dotfiles
- A configuration that remains understandable as it grows

### Paradigms I Aim to Create 

* vim style manual tiler
* dynamic supported

## Setup Outside of Wayland
This configuration should be usable without a graphical session. If for some reason something breaks, just simply `ctrl` + `alt` + `f(x)` into a different TTY. 
Possible uses:
If the enabling of numlock breaks your keyboard, this can be addressed in any TTY outside of TTY1. Just nvim into the `~/Nix_Dot_Files/modules/dm/tuigreet.nix` and comment out:

```nix
ExecStartPre = "${pkgs.bash}/bin/bash -c '${pkgs.kbd}/bin/setleds -D +num < /dev/tty1'";
```
## Code Style and Formatting

All Nix files in this project are formatted with **Alejandra**. If you're contributing or modifying configurations, run:

```bash
cd ~/Nix_Dot_Files
alejandra .
```
### Flake Structure
The `flake.nix` file largely points to `default.nix` for the system and user configurations, as well as the hardware configurations. 

### Build Tools
There is a task set to run inside the vscode config managed by home-manager. When you hit `Ctrl+Shift+B` to build, the following is ran:
```nix
nix flake update nixpkgs
sudo nixos-rebuild switch --flake ~/Nix_Dot_Files#generic
```