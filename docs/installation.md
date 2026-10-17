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

1. Select the appropriate host configuration: `desktop`, `laptop`, or `generic`. These correspond to the outputs defined in `flake.nix`.
2. Review the hardware configuration files and ensure the selected host uses the correct hardware configuration for your machine.
3. Update the user configuration under `modules/users/` and Home Manager settings to reflect your username and home directory.
4. Review the selected Wayland session and the settings in [Sway](sway.md) or [Hyprland](hyprland.md). Check the host-specific configuration before rebuilding.

Do not blindly copy the current machine's hardware configuration to another computer.

## Rebuild the System

From the repository root, run the rebuild script with your selected host:

```sh
./scripts/rebuild.sh desktop
```

Replace `desktop` with `laptop` or `generic` as appropriate.

Alternatively, run `nixos-rebuild` directly:

```sh
sudo nixos-rebuild switch --flake ~/Nix_Dot_Files#desktop
```

The `scripts/rebuild.sh` helper validates the host name and rebuilds the selected configuration.

## Upgrade NixOS

To update the `nixpkgs` flake input and rebuild the selected host, run:

```sh
./scripts/upgrade.sh desktop
```

Replace `desktop` with `laptop` or `generic` as appropriate.

Review the resulting `flake.lock` changes before committing them.

## VS Code Build Tasks

The repository includes VS Code build tasks for upgrading or rebuilding NixOS. Both tasks prompt you to select the target host: `desktop`, `laptop`, or `generic`.

### Upgrade NixOS

Press **Ctrl+Shift+B** to run the default build task, **Upgrade NixOS (choose host)**.

1. Select the host you want to upgrade.
2. The task runs `scripts/upgrade.sh` for that host.
3. The script updates the `nixpkgs` flake input and rebuilds the selected NixOS configuration.

Review the `flake.lock` changes after upgrading before committing them.

### Rebuild NixOS

To rebuild without updating the flake input first:

1. Open **Terminal → Run Build Task** in VS Code.
2. Select **Rebuild NixOS (choose host)**.
3. Select `desktop`, `laptop`, or `generic`.

This task runs `scripts/rebuild.sh` for the selected host.

Both tasks run in VS Code's integrated terminal and use the repository workspace as their working directory.

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