# ============================================================================
# Kanshi
# ============================================================================
{ pkgs, ... }: {
  home.packages = [
    pkgs.kanshi
  ];

  # Sway starts Kanshi. Its output profile is configured by the host-specific
  # module imported from flake.nix.
}
