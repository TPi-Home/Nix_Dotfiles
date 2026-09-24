# ============================================================================
# Nix System Core
# ============================================================================

{ ... }:

{
  # Leaving this here in case of home-manager corruption:
  programs.firefox.enable = true; 

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

  # Theme Support
  stylix.enable = true;
  stylix.autoEnable = false;
  programs.dconf.enable = true;

  # Wayland Support 
  services.dbus.implementation = "broker";
}
