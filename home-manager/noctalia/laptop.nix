{pkgs, ...}: {
  # Laptop-specific configuration for the 2560x1600 eDP panel.
  programs.noctalia.settings = ../../home/.config/noctalia/hosts/laptop.toml;
}
