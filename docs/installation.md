# Installation

## Table of Contents

- [README](../README.md)
- [About](about.md)
- [ToDo](todo.md)
- [Sway](sway.md)
- [Hyprland](hyprland.md)

---

## Clone

**Important: This installation guide is not fully tested on a fresh installation.**

1. Install NixOS.
2. Enable Nix flakes.
3. Clone the repository:

```sh
git clone https://github.com/TPi-Home/Nix_Dotfiles.git ~/Nix_Dot_Files
cd ~/Nix_Dot_Files
```

## Configure

1. Review the host configuration under `hosts/` and choose the appropriate machine configuration.
2. Review hardware configuration files and ensure the flake points to the correct configuration for your machine.
3. Update the user configuration under `modules/users/` and Home Manager settings to reflect your username and home directory.
4. Review the selected Wayland session and the settings in [Sway](sway.md) or [Hyprland](hyprland.md). Both are currently configured in this repository.

Do not blindly copy the current machine's hardware configuration to another computer.

## Rebuild the System

From the repository root, run:

```sh
sudo nixos-rebuild switch --flake ~/Nix_Dot_Files#generic
```

The helper script `scripts/rebuild.sh` runs this same command. The separate `scripts/upgrade.sh` updates the `nixpkgs` flake input before rebuilding; review the resulting lock-file changes before committing them.

## Clean the Nix Store

Review what the cleanup script does before running it:

```sh
./scripts/trash.sh
```

## Remove Old Generations

Review the script before running it; it removes older generations:

```sh
./scripts/gen.sh
```
