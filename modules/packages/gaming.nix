# ============================================================================
# Gaming
# ============================================================================

{pkgs, ...}:

{
  programs.steam = {
    enable = true;
  };

  programs.gamemode.enable = true;

  programs.gamescope = {
    enable = true;
    capSysNice = true; # Helps gamescope get real-time scheduling priority
  };

  environment.sessionVariables = {
    STEAM_FORCE_DESKTOPUI_SCALING = "1.5";
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