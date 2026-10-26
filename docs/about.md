# About

## Table of Contents

- [README](../README.md)
- [ToDo](todo.md)
- [Installation](installation.md)
- [Sway](sway.md)
- [Hyprland](hyprland.md)
- [Tmux](tmux.md)

---

## This project

This repository contains my personal NixOS configuration and dotfiles. The goal is to keep the system configuration declarative, reproducible, organized, and maintainable across multiple machines.

This is a **currently** personal work in progress, not a general-purpose NixOS installer. Review the configuration and adapt it before using it on different hardware. I may consider setting up an installation script.

## Philosophy and separation of responsibilities

I want system-wide configuration to provide the basic functionality a computer needs, while user-specific software and preferences are managed by Home Manager. GUI applications are generally not installed system-wide unless they are part of the system or Wayland session setup.

For most situations, a Home Manager Nix module that points to an application's config file is easier to maintain than expressing every application setting in Nix. The choice depends on what the application and Home Manager support. In my opinion, this is also more portable. If for some reason I want to also have an FHS compliant linux distro. Portability should make the fewest assumptions possible, at least in my opinion. 

| Directory | Purpose |
|---|---|
| `hosts/` | Machine-specific hostname and hardware configuration |
| `modules/` | Reusable NixOS system-level modules |
| `home-manager/` | User-level programs, desktop modules, and host-specific settings |
| `home/.config/` | Application configuration files managed by Home Manager |
| `scripts/` | System rebuild, upgrade, cleanup, and helper scripts |
| `docs/` | Installation and project documentation |
| `reference/` | Theme references and assets |

### Neovim
Neovim is **not** set up in the style of nix. Last time I tried to do it, I ended up way over my head. I may revisit this. 

## Current window-manager setup

Sway is the primary Wayland compositor. Hyprland is an alternative session for experimentation. Both can be selected through greetd/tuigreet and both use a systemd user scope named `wayland-session.scope`; Hyprland does not use UWSM.

Noctalia supplies the desktop shell for both sessions. Sway launches Kanshi, which reads the profile for the selected host. Hyprland's output mode and scale are configured in the host-specific Home Manager module. Shared application preferences are kept under `home/.config/`.

See [Sway](sway.md) and [Hyprland](hyprland.md) for session behavior, keybindings, and display settings.

## Setup outside Wayland

The configuration should remain accessible from a TTY if a graphical session fails. Switch to another available TTY with Ctrl+Alt+F2 or another function-key combination supported by the machine.

The greetd setup enables Num Lock before displaying the login screen. If that causes keyboard input problems on a particular machine, switch to another TTY and edit `modules/dm/tuigreet.nix`. Comment out the `ExecStartPre` line that invokes `setleds`, then rebuild.

## Code style and formatting

Nix files in this project are formatted with `Nix Fmt` referencing `nixfmt` in the flake. From the repository root, run:

```sh
nix fmt .
```

See:

[nixfmt](https://github.com/NixOS/nixfmt)

## Flake structure

The flake currently defines three NixOS outputs: `generic`, `desktop`, and `laptop`. Each output imports the shared NixOS modules, the matching host configuration, Stylix, Home Manager, and that host's Noctalia, Kanshi, Sway, and Hyprland modules.

The application modules are imported in `home-manager/default.nix`. The actual NixOS system generation is selected by the host argument passed to `scripts/rebuild.sh` or `scripts/upgrade.sh`.

The file `docs/implement.nix` is a leftover example rather than an imported module. It is not part of the active configuration and should not be copied without reviewing it.
