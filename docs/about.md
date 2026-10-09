# About

## Table of Contents

- [README](../README.md)
- [ToDo](todo.md)
- [Installation](installation.md)
- [Sway](sway.md)
- [Hyprland](hyprland.md)

---

## This Project

This repository contains my personal NixOS configuration and dotfiles.

The goal is to keep my system configuration **declarative, reproducible, organized, and easy to maintain** across multiple machines.

## Philosophy and Separation of Responsibilities

### Philosophy

I want system-wide configuration to provide the basic functionality a computer needs, while user-specific software and configuration are managed by Home Manager. I generally do not see a reason to install GUI applications system-wide unless they are essential to a Wayland window-manager or display-manager session.

For most situations, a Home Manager Nix file that points to an application config file is the easiest way I have found to avoid fighting with NixOS. Assigning extra application configuration in Nix language is not inherently superior to pointing Nix at a config file.

### Separation of Responsibilities

The configuration is split into reusable pieces so machine-specific settings, system functionality, and user configuration remain separate.

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

## Window-manager workflows

- **Manual tiling:** keyboard-driven window management in the style of Vim/Sway.
- **Dynamic tiling:** experimentation with layouts and alternative window managers, including Hyprland.

See [Sway](sway.md) and [Hyprland](hyprland.md) for the current session configurations.

## Setup Outside of Wayland

This configuration should remain usable without a graphical session. If a graphical session breaks, switch to another TTY with `Ctrl+Alt+F2` (or another available function-key TTY).

If enabling Num Lock breaks keyboard input at the login screen, switch to a different TTY and edit `~/Nix_Dot_Files/modules/dm/tuigreet.nix`. Comment out this line:

```nix
ExecStartPre = "${pkgs.bash}/bin/bash -c '${pkgs.kbd}/bin/setleds -D +num < /dev/tty1'";
```

## Code Style and Formatting

Nix files in this project are formatted with **Alejandra**. To format them, run:

```bash
cd ~/Nix_Dot_Files
alejandra .
```

## Flake Structure

`flake.nix` defines the NixOS `generic` configuration and imports the system modules, Stylix, and Home Manager. The machine-specific configuration is selected from `hosts/generic/`; desktop and laptop host configurations are also present.

## Build Tools

The VS Code build task runs:

```sh
nix flake update nixpkgs
sudo nixos-rebuild switch --flake ~/Nix_Dot_Files#generic
```

The first command updates the locked `nixpkgs` input, so this task updates dependencies as well as rebuilding. For a rebuild without updating the lock file, use:

```sh
sudo nixos-rebuild switch --flake ~/Nix_Dot_Files#generic
```
