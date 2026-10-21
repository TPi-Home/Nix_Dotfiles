# Installation

## Table of Contents

- [README](../README.md)
- [About](about.md)
- [ToDo](todo.md)
- [Sway](sway.md)
- [Hyprland](hyprland.md)
- [Tmux](tmux.md)

---

## Before you begin

**This guide has not been fully tested on a clean installation.** It describes this personal configuration, not a generic NixOS installer.

The flake currently targets `x86_64-linux`. Install NixOS first and make sure flakes are available to the Nix CLI. This repository enables `nix-command` and `flakes` in the system configuration, but the existing installation must be able to evaluate the flake before that configuration is applied.

The current user configuration is specific to the user `tyler` and home directory `/home/tyler`. Noctalia config files also use absolute paths under `/home/tyler/Nix_Dot_Files`. The examples below use that path intentionally. If your username or checkout path differs, update the relevant user and Noctalia path settings before rebuilding.

## Clone

To reproduce the branch this guide describes:

~~~sh
git clone --branch noctalia_master https://github.com/TPi-Home/Nix_Dotfiles.git ~/Nix_Dot_Files
cd ~/Nix_Dot_Files
~~~

If you use a different branch, confirm that its configuration and documentation match before proceeding.

## Configure the target host

Choose exactly one matching flake output: `desktop`, `laptop`, or `generic`. The script does not detect your hardware automatically.

1. Review `hosts/<host>/default.nix` and `hosts/<host>/hardware-configuration.nix`. The desktop and laptop definitions import NVIDIA support. Do not reuse the repository's hardware configuration on another machine without checking disk identifiers, filesystems, boot devices, and detected hardware.
2. Compare the selected hardware file with the configuration generated on the target machine, usually `/etc/nixos/hardware-configuration.nix`. Adapt the host-specific file as needed before the first rebuild.
3. Review `modules/users/tyler.nix`, `home-manager/default.nix`, and the absolute paths in `home/.config/noctalia/hosts/*.toml` if your user or checkout directory differs.
4. Review the chosen session and display settings in [Sway](sway.md) or [Hyprland](hyprland.md). Per-host display, cursor, Noctalia, and application scaling are configured under `home-manager/`.
5. Make a backup of your existing system configuration and ensure you can recover from a failed graphical session using a TTY.

The `system.stateVersion` and `home.stateVersion` values are compatibility settings, not package-version selectors. Do not change them simply to update NixOS or Home Manager.

## Rebuild NixOS

From the repository root, run the rebuild helper with the host that matches the machine:

~~~sh
./scripts/rebuild.sh desktop
~~~

Replace `desktop` with `laptop` or `generic` as appropriate. The script validates the argument and runs `nixos-rebuild switch --flake <repo-root>#<host>`.

You can also run the rebuild directly:

~~~sh
sudo nixos-rebuild switch --flake ~/Nix_Dot_Files#desktop
~~~

Check the evaluation and review any errors before relying on the resulting system. The generic output does not force a particular monitor rule, but it still uses the repository's shared user and application setup.

## Upgrade NixOS

To update the nixpkgs input and rebuild the selected host:

~~~sh
./scripts/upgrade.sh desktop
~~~

Replace `desktop` with `laptop` or `generic`. This helper updates the `nixpkgs` flake input, then rebuilds the selected output. It does not intentionally update every other flake input.

Review the changes to `flake.lock` before committing them. If an upgrade fails, use the usual NixOS generation rollback/recovery process rather than repeatedly changing unrelated configuration.

## VS Code build tasks

The repository includes VS Code tasks for both scripts. With the repository open as a workspace:

### Upgrade NixOS

Press Ctrl+Shift+B to run the default task, **Upgrade NixOS (choose host)**. Select `desktop`, `laptop`, or `generic`. It runs `scripts/upgrade.sh` in the integrated terminal.

### Rebuild NixOS

Open **Terminal → Run Build Task**, then select **Rebuild NixOS (choose host)** and the target host. This runs `scripts/rebuild.sh` without updating the flake input first.

## Cleanup scripts

Review each script before running it, especially before deleting generations that you may need for rollback.

~~~sh
./scripts/trash.sh
./scripts/gen.sh
~~~

- `trash.sh` runs `nix-collect-garbage` to collect store paths that are no longer reachable.
- `gen.sh` removes system-profile generations older than the five newest ones. It does not run garbage collection itself; read its message and decide whether you also want to collect old generations and store paths.
