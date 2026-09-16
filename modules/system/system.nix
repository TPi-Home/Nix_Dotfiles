# ============================================================================
# Input / System Services (I refuse to place packages that get installed via enable with defaults in packages)
# ============================================================================

{...}:

{

  services.libinput.enable = true;
  services.flatpak.enable = true;

  # ============================================================================
  # Nix
  # ============================================================================

  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

}