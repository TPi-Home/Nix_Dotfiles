# About

## Table of Contents
- [README](../README.md)
- [ToDo](todo.md)
- [Installation](installation.md)
- [Sway](sway.md)
- [Mango](mango.md)

---

## This Project
This repository contains my personal NixOS configuration and dotfiles.

The goal is to keep my system configuration **declarative, reproducible, organized, and easy to maintain** across multiple machines.

## Philosophy

I had to give NixOS a try as it was all the rage in the linux community. I now use NixOS to make system configuration explicit rather than relying on undocumented changes made manually over time.

The configuration is split into reusable pieces so that machine-specific settings, system functionality, and user configuration remain separate. 

Not everything can be managed declaratively. Software or configuration that is impractical to manage through Nix can be found in the `imperative/` section.

## Goals

- Reproducible NixOS installations
- Shared configuration across machines
- Declarative system and user configuration
- Minimal duplication
- Easy rollbacks and recovery
- Version-controlled dotfiles
- A configuration that remains understandable as it grows

### Paradigms I Aim to Create 

* vim style manual tiler
* dynamic supported

## Setup Outside of Wayland
## Code Style and Formatting

All Nix files in this project are formatted with **Alejandra**. If you're contributing or modifying configurations, run:

```bash
cd ~/Nix_Dot_Files
alejandra .
```
### Flake Structure
The `flake.nix` file largely points to `default.nix` for the system and user configurations, as well as the hardware configurations. 