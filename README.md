# Nix_Dot_Files
I am likely going to regret this. 

## Table of Contents
- [README](README.md)
- [About](./docs/about.md)
- [ToDo](./docs/todo.md)
- [Sway](./docs/sway.md)

---
## Use Case
I have long wanted to experiment with different workflows in Linux. The problem with experimentation is obvious: dependencies, configurations, and general clutter from software you no longer use pile up the more you experiment. Enter Nix, which, for the sake of this discussion, can function almost atomically.

This project aims to provide a modular, relatively unopinionated starting point where individual components can be enabled, disabled, replaced, or extended without committing to a particular desktop environment, editor, shell, or workflow.

The goal is to make it easier to try a different workflow without starting from scratch or inheriting incompatible configuration. That was the position I found myself in when I started learning NixOS, and hopefully this can serve the same purpose for others. 

> **Warning:** This is primarily my goal, not a claim that this project is ready to be installed as a complete system, especially by beginners. It is still a work in progress and reflects my own experimentation with NixOS. It wasn't until I saw how easily Nix could be used to build a custom environment brick by brick that I realized how powerful it is as a tool for experimentation.

## Screenshots
![Screenshot 1](scrot.png)
![Screenshot 2](scrot2.png)
## Credits

### Wallpaper Credit
Madison has made some of my favorite wallpapers to use, many of which I have used for years now. 

**[Positron Dream](https://www.positrondream.com/about)**

**[Madison's Reddit](https://www.reddit.com/user/Madisor_)**
### Color Scheme Credit
**[AstroNvim's Astrodark](https://astronvim.com/)**

## Install

### **This is untested:**

1. Install NixOS.

2. Enable Nix Flakes.

3. Clone the repository:

```bash
git clone https://github.com/TPi-Home/Nix_Dotfiles.git ~/Nix_Dot_Files
```

4. Copy your hardware configuration to the appropriate hardware configuration file in `~/Nix_Dot_Files`.

5. Update the `default.nix` in the `modules` folder to reflect the location of your hardware configuration.

6. Update the `users` file in `modules/users` to reflect your desired user setup. Update the home-manager environment to reflect your desired setup.

7. Run:

```bash
cd ~/Nix_Dot_Files/scripts
chmod +x upgrade.sh
./upgrade.sh
```


## Layout
To understand my thinking with this layout, I wanted apps that most people need to have a working PC to be handled system wide while user specific software and configs were handled with home-manager.

```text
Nix_Dot_Files
├── docs
│   ├── about.md
│   ├── implement
│   ├── implement.nix
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
│   ├── pkg
│   │   ├── chromium.nix
│   │   ├── firefox.nix
│   │   ├── fish.nix
│   │   ├── fuzzel.nix
│   │   ├── git.nix
│   │   ├── helix.nix
│   │   ├── kanshi.nix
│   │   ├── kitty.nix
│   │   ├── packages.nix
│   │   ├── qutebrowser.nix
│   │   ├── starship.nix
│   │   ├── unity_hub.nix
│   │   ├── vivaldi.nix
│   │   ├── vscode.nix
│   │   └── wlogout.nix
│   ├── stylix
│   │   ├── default.nix
│   │   └── include.nix
│   └── sway
│       ├── sway.nix
│       └── waybar.nix
├── hosts
│   ├── desktop
│   │   ├── default.nix
│   │   └── hardware-configuration.nix
│   ├── generic
│   │   ├── default.nix
│   │   └── hardware-configuration.nix
│   └── laptop
│       ├── default.nix
│       └── hardware-configuration.nix
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
│   ├── rebuild.sh
│   ├── security_check.sh
│   ├── trash.sh
│   └── upgrade.sh
├── scrot2.png
└── scrot.png
```
**The Above Structure is a Work In Progress**
## Structure

### Separation of Responsibilities

| Directory | Purpose |
|---|---|
| `hosts/` | Things that differ between machines |
| `modules/` | Reusable NixOS system configuration |
| `home-manager/` | Home Manager declarations and user-level configuration |
| `home/` | Actual application configuration files |
| `scripts/` | Convenience/maintenance scripts |
| `imperative/` | Non-declarative setup material and documentation |
| `deprecated/` | Previous approaches retained for reference |

### Configuration flow

```text
flake.nix
    │
    ├── hosts/<machine>/
    │       └── hardware-configuration.nix
    │
    ├── modules/
    │       ├── system/
    │       ├── networking/
    │       ├── audio/
    │       ├── nvidia/
    │       ├── de/
    │       └── ...
    │
    └── home-manager/
            │
            ├── packages.nix
            ├── git.nix
            ├── nvim.nix
            ├── kitty.nix
            ├── vscode.nix
            └── ...
                    │
                    ▼
                  home/
                    └── .config/
                          ├── nvim/
                          ├── kitty/
                          ├── Code/
                          └── starship.toml
```
For most situations, home manager having a nix file that points to a config file is the easiest way I have found to avoid my fighting with NixOS. 