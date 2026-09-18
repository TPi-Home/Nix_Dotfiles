# ============================================================================
# Input / System Services (I refuse to place packages that get installed via enable with defaults in packages)
# ============================================================================

{ ... }:

{

  services.libinput.enable = true;
  services.flatpak.enable = true;
  programs.firefox.enable = true;

  programs.uwsm = {
    enable = true;
    # You must configure the waylandCompositors suboptions so that UWSM knows which compositors to manage. 
    waylandCompositors = {
      sway = {
        prettyName = "Sway";
        comment = "Sway compositor managed by UWSM";
        binPath = "/run/current-system/sw/bin/sway";
      };
    };
  };
  
  # ============================================================================
  # Nix
  # ============================================================================

  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

}
