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
  services.flatpak.enable = true;
  
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Wayland Support 
  services.dbus.implementation = "broker";

  programs.uwsm = {
    enable = true;
    waylandCompositors = {
      sway = {
        prettyName = "Sway";
        comment = "Sway compositor managed by UWSM";
        binPath = "/run/current-system/sw/bin/sway";
      };
    };
  };

}
