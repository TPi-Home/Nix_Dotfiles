# ============================================================================
# Gaming
# ============================================================================

{pkgs, ...}:

{
  programs.steam = {
    enable = true;
    package = pkgs.steam.override {
      extraEnv = { STEAM_FORCE_DESKTOPUI_SCALING = "1"; };
    };
  };

  programs.gamemode.enable = true;

  programs.gamescope = {
    enable = true;
    capSysNice = true; # Helps gamescope get real-time scheduling priority
  };
  
  environment.systemPackages = with pkgs; [

    # --------------------------------------------------------------------------
    # Gaming Utilities
    # --------------------------------------------------------------------------

    #bubblewrap   

    # --------------------------------------------------------------------------
    # Games from Nix Pkgs
    # --------------------------------------------------------------------------

    cataclysm-dda

  ];
}