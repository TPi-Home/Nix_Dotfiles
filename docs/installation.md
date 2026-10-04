# Installation

## Table of Contents
- [README](../README.md)
- [About](about.md)
- [ToDo](todo.md)
- [Sway](sway.md)

---

## Clone

### **IMPORTANT: This is untested.**

1. Install NixOS.

2. Enable Nix Flakes.

3. Clone the repository:

```bash
git clone https://github.com/TPi-Home/Nix_Dotfiles.git ~/Nix_Dot_Files
```

## Configure
1. Copy your hardware configuration to the appropriate hardware configuration file in `~/Nix_Dot_Files`. Alternatively, point the flake to `/etc/nixos/hardware-configuration.nix`.

2. Update the `default.nix` in the `modules` folder to reflect the location of your hardware configuration.

3. Update the `users` file in `modules/users` to reflect your desired user setup. Update the home-manager environment to reflect your desired setup.

## Install or Upgrade
Run:

```bash
cd ~/Nix_Dot_Files/scripts
chmod +x upgrade.sh
./upgrade.sh
```
## Rebuild System After Configuring: 
Run:

```bash
cd ~/Nix_Dot_Files/scripts
chmod +x rebuild.sh
./upgrade.sh
```
## Clean Nix Store 
Run:

```bash
cd ~/Nix_Dot_Files/scripts
chmod +x trash.sh
./trash.sh
```

## Remove Generations (except the last 5)
Run:

```bash
cd ~/Nix_Dot_Files/scripts
chmod +x gen.sh
./gen.sh
```
