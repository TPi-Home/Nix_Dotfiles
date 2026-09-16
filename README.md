# Nix_Dot_Files
I am likely going to regret this. 

## Table of Contents
- [About](About.md)
- [ToDo](ToDo.md)

**Imperative Implementations**
- [Imperative/What?](imperative/What.md)
- [Imperative/Why?](imperative/Why.md)

---

## Layout

```text
Nix_Dotfiles/
├── flake.nix                    
├── flake.lock                   
│
├── hosts/                       
│   ├── desktop/
│   │   ├── default.nix
│   │   └── hardware-configuration.nix
│   │
│   ├── laptop/
│   │   ├── default.nix
│   │   └── hardware-configuration.nix
│   │
│   └── generic/
│       ├── default.nix
│       └── hardware-configuration.nix
│
├── modules/                     
│   ├── default.nix              
│   │
│   ├── audio/
│   │   └── audio.nix
│   │
│   ├── boot/
│   │   └── boot.nix
│   │
│   ├── de/
│   │   ├── gnome.nix
│   │   └── hyprland.nix
│   │
│   ├── locale/
│   │   └── locale.nix
│   │
│   ├── networking/
│   │   └── networking.nix
│   │
│   ├── nvidia/
│   │   └── nvidia.nix
│   │
│   ├── packages/
│   │   └── packages.nix
│   │
│   ├── system/
│   │   └── system.nix
│   │
│   └── users/
│       └── tyler.nix
│
├── home-manager/                
│   ├── default.nix              
│   ├── packages.nix             
│   ├── fish.nix                 
│   ├── zsh.nix                  
│   ├── git.nix                  
│   ├── kitty.nix                
│   ├── nvim.nix                 
│   ├── helix.nix                
│   ├── starship.nix             
│   └── vscode.nix               
│
├── home/       
│   └── .config/
│       ├── Code/
│       │   └── User/
│       │       └── settings.json
│       │
│       ├── kitty/
│       │   ├── kitty.conf
│       │   └── themes/
│       │       └── *.conf        
│       │
│       ├── nvim/
│       │   ├── init.lua
│       │   ├── nvim-pack-lock.json
│       │   ├── .stylua.toml
│       │   ├── lua/
│       │   │   ├── custom/
│       │   │   │   └── plugins/
│       │   │   │       └── init.lua
│       │   │   │
│       │   │   └── kickstart/
│       │   │       ├── health.lua
│       │   │       └── plugins/
│       │   │           ├── autopairs.lua
│       │   │           ├── debug.lua
│       │   │           ├── indent_line.lua
│       │   │           ├── lint.lua
│       │   │           └── neo-tree.lua
│       │   │
│       │   └── .gitignore
│       │
│       └── starship.toml
│
├── scripts/                    
│   ├── rebuild.sh
│   ├── upgrade.sh
│   ├── editglobalconf.sh
│   └── trash.sh
│
├── imperative/                  
│   ├── Setup_Example
│   ├── What.md
│   └── Why.md
│
├── deprecated/                 
│   ├── configuration.nix
│   ├── update_config.sh
│   ├── vscode_astrodark.json
│   └── alternative_configs/
│       └── nvim/
│           └── onedark.lua
│
├── README.md                    
├── About.md                     
├── ToDo.md                      
├── LICENSE
└── .gitignore
```

## Structure

### Separation of responsibilities

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