{pkgs, ...}: {
  # Portable fallback without assumptions about a particular output name.
  programs.noctalia.settings = ../../home/.config/noctalia/hosts/generic.toml;
}
