# ============================================================================
# Nix System Core
# ============================================================================

{ ... }:

{
  # Input Hardware Support
  services.libinput.enable = true;

  # Software Management
  nixpkgs.config.allowUnfree = true;
  # services.flatpak.enable = true;
  
  nix.settings.experimental-features = 
  [
    "nix-command"
    "flakes"
  ];

}
