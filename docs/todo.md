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

- [ ] Test each flake output with the intended physical machine: desktop, laptop, and generic.
- [ ] Test a clean installation procedure; it has not yet been validated end to end.
- [ ] Verify output names, modes, monitor scaling, pointer-cursor sizes, and application scaling in both Sway and Hyprland after a rebuild.
- [ ] Review the Hyprland host-specific monitor rule and startup behavior on the actual desktop and laptop hardware. Also fix floating windows out of bounds.
- [ ] Continue investigating suspend/resume reliability on the NVIDIA desktop.
- [ ] Review Home Manager and bootloader update workflow; consider adding `nh`.
- [ ] Check fullscreen/floating behavior around the Noctalia bar.
- [ ] Add nix-ld
- [ ] Add nh and implement with flake
- [ ] Open terminal here doesn't work

## Potential improvements

- Consider the Cachy kernel only if a trusted binary cache is available and the benefit is clear.
- Explore cloud-storage mounting and a file-transfer service for the Pi Zero.
- Consider whether weather information belongs in Fastfetch or another fetch tool.
- Add and test the planned shell aliases: `sc` for scim, `vi` for vim, and `vim` for Neovim.

## Future experiments

MangoWM and Niri are ideas for future experimentation, not currently configured sessions in this repository. Any future compositor should reuse the existing separation between NixOS system modules, Home Manager host-specific settings, and application config files rather than copying the older component tables from this file.

## Notes

`docs/implement.nix` is an old Kanshi service example, not an active module. The current Kanshi package/profile setup is in `home-manager/programs/services/kanshi.nix` and `home-manager/kanshi/`; Sway launches Kanshi directly from its config.
