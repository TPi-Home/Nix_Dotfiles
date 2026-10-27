# NixOS / Dotfiles To-Do

## Table of Contents

- [README](../README.md)
- [About](about.md)
- [Installation](installation.md)
- [Sway](sway.md)
- [Hyprland](hyprland.md)
- [Tmux](tmux.md)

---

## Validation and maintenance
- [ ] Test each flake output with the intended physical machine: desktop, laptop, and generic. Maybe I could explore a way to setup generic to autodetect host configuration. 
- [ ] Test a clean installation procedure; it has not yet been validated end to end.
- [ ❌ ] Continue investigating suspend/resume reliability on the NVIDIA desktop. (until my workaround PR is merged or PatchELF fixed) Edit: `nvidia-smi` works now but I am keeping this here as a reminder to either consolidate invocations later or review history of that bug (dating back to at least 2021)
- [ ] Consolidate:
```
{ inputs, ... }:
{
  imports = [
    inputs.noctalia.nixosModules.default
  ];

  programs.noctalia = {
    enable = true;

    # Enables NetworkManager, Bluetooth, UPower, and a power profile service.
    recommendedServices.enable = true;
  };
}
```



## Potential improvements
- [ ] Add Mango and Niri options. 
- [ ] Set up a cachix server or automated build system for noctalia so I am not rebuilding it every day
- [ ] Check fullscreen/floating behavior around the Noctalia bar.
- [ ] Consider `nix-ld` 
- [ ❌ ] Add nh and implement with flake
- [ ] Open terminal here doesn't work
- [ ❌ ] Ensure this runs at startup:
```
rclone mount OneDrive: ~/OneDrive \
        --vfs-cache-mode writes \
        --daemon
```
- [ ] Need better sandboxing
- [ ] Is `let` & `in` bad form? 
- [ ] Consider the Cachy kernel only if a trusted binary cache is available and the benefit is clear. Alternatively, host a server to build the kernel automatically on update.
- [ ] Add Noctalia greeter to flake and DM folder (if I can wrap the session in a way that allows me to switch between window managers)
- [ ] Fix Mouse disappearing when typing
- [ ⚠️ ] Groups need some love
- [ ] Fix floating windows out of bounds. (only affects hyprland)
- [ ] 

## Future experiments

MangoWM and Niri are ideas for future experimentation, not currently configured sessions in this repository. Any future compositor should reuse the existing separation between NixOS system modules, Home Manager host-specific settings, and application config files rather than copying the older component tables from this file.

