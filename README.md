# Nix_Dot_Files
I am likely going to regret this. 

## Table of Contents
- [About](./docs/about.md)
- [ToDo](./docs/todo.md)
- [Sway](./docs/sway.md)
- [Installation](./docs/installation.md)

---
## Use Case

I have long wanted to experiment with different workflows in Linux. The problem with experimentation is obvious: dependencies, configurations, and general clutter from software you no longer use pile up the more you experiment. Enter Nix, which, for the sake of this discussion, can function almost atomically.

This project aims to provide a modular, relatively unopinionated starting point where individual components can be enabled, disabled, replaced, or extended without committing to a particular desktop environment, editor, shell, or workflow.

> **Warning:** This is primarily my personal setup and a work in progress. It reflects my own experimentation with NixOS and is not intended as a complete, production-ready system. Expect issues and review what you're enabling before deploying

## Screenshots
![Screenshot 1](scrot.png)
![Screenshot 2](scrot2.png)
## Credits

### Visual Inspiration Credit
Madison has made some of my favorite wallpapers to use, many of which I have used for years now. 

**[Positron Dream](https://www.positrondream.com/about)**

**[Madison's Reddit](https://www.reddit.com/user/Madisor_)**
### Color Scheme Credit
**[AstroNvim's Astrodark](https://astronvim.com/)**

## Layout
To understand my thinking with this layout, I wanted apps that most people need to have a basic functional PC to be handled system wide while user specific software and configs were handled with home-manager. Most notably, I don't see a good reason to allow GUI applications to be installed system wide unless it is essential for a wayland window manager/display manager session. 
For most situations, home manager having a nix file that points to a config file is the easiest way I have found to avoid my fighting with NixOS. 
```text
Nix_Dot_Files
├── docs
│   ├── about.md
│   ├── installation.md
│   ├── sway.md
│   └── todo.md
├── flake.lock
├── flake.nix
├── .gitignore
├── home
│   └── .config
│       ├── Code
│       │   └── User
│       │       └── settings.json
│       ├── fuzzel
│       │   └── fuzzel.ini
│       ├── kitty
│       │   ├── kitty.conf
│       │   └── themes
│       │       └── astrodark.conf
│       ├── starship.toml
│       ├── stylix
│       │   ├── astrodark_gtk.yaml
│       │   └── backup.yaml
│       ├── sway
│       │   ├── config
│       │   └── waybar
│       │       ├── config.jsonc
│       │       └── style.css
│       └── wlogout
│           ├── config.json
│           └── style.css
├── home-manager
│   ├── default.nix
│   ├── programs
│   │   ├── browsers
│   │   │   ├── chromium.nix
│   │   │   ├── firefox.nix
│   │   │   ├── librewolf.nix
│   │   │   ├── qutebrowser.nix
│   │   │   └── vivaldi.nix
│   │   ├── cli
│   │   │   ├── fish.nix
│   │   │   ├── git.nix
│   │   │   ├── starship.nix
│   │   │   └── tmux.nix
│   │   ├── editors
│   │   │   ├── helix.nix
│   │   │   └── vscode.nix
│   │   ├── misc
│   │   │   ├── obs.nix
│   │   │   ├── ollama.nix
│   │   │   ├── programs.nix
│   │   │   └── unity_hub.nix
│   │   ├── services
│   │   │   ├── fuzzel.nix
│   │   │   ├── kanshi.nix
│   │   │   └── wlogout.nix
│   │   └── terminals
│   │       ├── alacritty.nix
│   │       └── kitty.nix
│   ├── stylix
│   │   ├── dconf.nix
│   │   ├── default.nix
│   │   └── include.nix
│   └── sway
│       ├── sway.nix
│       └── waybar.nix
├── hosts
│   ├── desktop
│   │   ├── default.nix
│   │   ├── desktop_specific.nix
│   │   └── hardware-configuration.nix
│   ├── generic
│   │   ├── default.nix
│   │   └── hardware-configuration.nix
│   └── laptop
│       ├── default.nix
│       ├── hardware-configuration.nix
│       └── laptop_specific.nix
├── LICENSE
├── modules
│   ├── audio
│   │   └── audio.nix
│   ├── de
│   │   ├── mango.nix
│   │   └── sway.nix
│   ├── default.nix
│   ├── dm
│   │   └── tuigreet.nix
│   ├── graphics
│   │   └── nvidia.nix
│   ├── packages
│   │   ├── gaming.nix
│   │   └── packages.nix
│   ├── system
│   │   ├── boot.nix
│   │   ├── fonts.nix
│   │   ├── locale.nix
│   │   ├── networking.nix
│   │   ├── security.nix
│   │   ├── session.nix
│   │   └── system.nix
│   └── users
│       └── tyler.nix
├── README.md
├── reference
│   ├── astrodark.lua
│   └── Hilltopper.png
├── scripts
│   ├── editglobalconf.sh
│   ├── gen.sh
│   ├── rebuild.sh
│   ├── security_check.sh
│   ├── trash.sh
│   ├── tree.sh
│   └── upgrade.sh
├── scrot2.png
└── scrot.png
37 directories, 82 files

```
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

### Configuration flow

For most situations, home manager having a nix file that points to a config file is the easiest way I have found to avoid my fighting with my operating system. Extra config being assigned by nix in nix lang is not somehow superior to just pointing nix to a config file in my opinion.

## Notable Dependencies

| Dependency | Level | Purpose | Notes |
|---|---|---|---|
| **NixOS** | System | Base operating system | Flakes must be enabled |
| **Home-Manager** | User | User-level configuration management | Declarative dotfiles and per-user settings |
| **Stylix** | User | Unified theming across applications | Color scheme and wallpaper management |
| **Sway** | User | Wayland window manager | Primary DE; configured in `home-manager/sway` |
| **Alejandra** | System | Nix code formatter | Used for consistent code style across the project |

## Hardware Support

This project has been tested on:

- **GPUs:** NVIDIA (CUDA-capable), Intel integrated graphics
- **CPUs:** AMD Ryzen, Intel Core, and their variants
- **Form factors:** Desktop and laptop configurations

This project has not been tested on:
- **GPUs:** AMD (RDNA/RDNA2) - I could test it on my steam deck

The modular structure in `modules/graphics` allows you to select the appropriate driver stack for your hardware.
