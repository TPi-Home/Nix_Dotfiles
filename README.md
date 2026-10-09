# Nix_Dot_Files

I am likely going to regret this.

## Table of Contents

- [About](./docs/about.md)
- [ToDo](./docs/todo.md)
- [Installation](./docs/installation.md)
- [Sway](./docs/sway.md)
- [Hyprland](./docs/hyprland.md)

---

## Use Case

I have long wanted to experiment with different workflows in Linux. The problem with experimentation is obvious: dependencies, configurations, and general clutter from software you no longer use pile up the more you experiment. Nix, for the sake of this discussion, can function almost atomically.

This project aims to provide a modular, relatively unopinionated starting point where individual components can be enabled, disabled, replaced, or extended without committing to a particular desktop environment, editor, shell, or workflow.

> **Warning:** This is primarily my personal setup and a work in progress. It reflects my own experimentation with NixOS and is not intended as a complete, production-ready system. Expect issues and review what you're enabling before deploying.

## Window-manager sessions

Sway is the primary configuration and Hyprland is an experimental alternative. Both are currently included in the system and Home Manager module imports, and both can be selected through the `greetd`/`tuigreet` session selector. Hyprland is configured without UWSM; both sessions use the `systemd-run --user --scope --unit=wayland-session` wrapper.

The window-manager-specific setup is documented separately:

- [Sway setup](./docs/sway.md)
- [Hyprland setup](./docs/hyprland.md)

## Screenshots

![Screenshot 1](scrot.png)
![Screenshot 2](scrot2.png)

## Credits

### Visual Inspiration

Madison has made some of my favorite wallpapers to use, many of which I have used for years now.

- [Positron Dream](https://www.positrondream.com/about)
- [Madison's Reddit](https://www.reddit.com/user/Madisor_)

### Color Scheme

- [AstroNvim's Astrodark](https://astronvim.com/)

## Layout

The repository includes:

- `docs/`: project, installation, and window-manager documentation
- `modules/`: NixOS system modules, including both Sway and Hyprland session definitions
- `home-manager/`: user-level program and desktop configuration
- `home/.config/`: application configuration files
- `hosts/`: generic, desktop, and laptop machine profiles
- `scripts/`: rebuild, upgrade, cleanup, and helper scripts
- `reference/`: theme references and other assets

## Structure

### Philosophy: Separation of Responsibilities

| Directory | Purpose |
|---|---|
| `hosts/` | Machine-specific configuration (desktop, laptop, etc.) |
| `modules/` | Reusable NixOS system-level configuration blocks |
| `home-manager/` | User-level programs and their NixOS integration |
| `home/.config/` | Actual application configuration files (dotfiles) |
| `scripts/` | Convenience scripts for system management |
| `docs/` | Detailed documentation on specific topics |
| `reference/` | Assets and reference material |

### Configuration Flow

For most situations, Home Manager having a Nix file that points to a config file is the easiest way I have found to avoid fighting with my operating system. Extra config being assigned in Nix language is not inherently superior to pointing Nix at an application config file.

## Notable Dependencies

| Dependency | Level | Purpose | Notes |
|---|---|---|---|
| **NixOS** | System | Base operating system | Flakes must be enabled |
| **Home Manager** | User | Declarative user configuration | Dotfiles and per-user settings |
| **Stylix** | User / system integration | Theming | Shared theme configuration |
| **Sway** | System + user | Primary Wayland compositor | Configured in `modules/de/sway.nix`, `home-manager/sway/`, and `home/.config/sway/` |
| **Hyprland** | System + user | Experimental alternative Wayland compositor | Configured in `modules/de/hyprland.nix`, `home-manager/hyprland/`, and `home/.config/hypr/`; UWSM disabled |
| **greetd / tuigreet** | System | Login and session selection | Starts the selected session in a systemd user scope |
| **Kanshi** | User | Output profile management | Currently started by the selected compositor, not by its commented-out systemd user service |
| **Alejandra** | System package | Nix formatter | Used for consistent Nix code style |

## Hardware Support

**This is a personal configuration. Check the NixOS hardware documentation before adapting it to other machines.**

The configuration has been used with NVIDIA graphics and AMD Ryzen / Intel CPUs. Hardware-specific files are under `hosts/`, and the NVIDIA module is under `modules/graphics/`.

AMD GPU support has not been tested in this setup.
