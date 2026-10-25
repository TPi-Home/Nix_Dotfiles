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
- [ ] Set up a cachix server or automated build system for noctalia so I am not rebuilding it every day
- [ ] Test each flake output with the intended physical machine: desktop, laptop, and generic. Maybe I could explore a way to setup generic to autodetect host configuration. 
- [ ] Test a clean installation procedure; it has not yet been validated end to end.
- [ ] Verify output names, modes, monitor scaling, pointer-cursor sizes, and application scaling in both Sway and Hyprland after a rebuild.
- [ ] Review the Hyprland host-specific monitor rule and startup behavior on the actual desktop and laptop hardware. Also fix floating windows out of bounds.
- [ ] Continue investigating suspend/resume reliability on the NVIDIA desktop. (until my workaround PR is merged or PatchELF fixed)
- [ ] Check fullscreen/floating behavior around the Noctalia bar.
- [ ] Add nix-ld
- [ ] Add nh and implement with flake
- [ ] Open terminal here doesn't work
- [ ] Ensure this runs at startup:
```
rclone mount OneDrive: ~/OneDrive \
        --vfs-cache-mode writes \
        --daemon
```

## Potential improvements

- [ ] Consider the Cachy kernel only if a trusted binary cache is available and the benefit is clear.
- [ ] Noctalia greeter to flake and DM folder (if I can wrap the session in a way that allows me to switch between window managers)
- [ ] Fix Mouse disappearing when typing on Firefox
- [] Groups need some love

## Future experiments

MangoWM and Niri are ideas for future experimentation, not currently configured sessions in this repository. Any future compositor should reuse the existing separation between NixOS system modules, Home Manager host-specific settings, and application config files rather than copying the older component tables from this file.

