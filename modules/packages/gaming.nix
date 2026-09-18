# ============================================================================
# Gaming
# ============================================================================

{pkgs, ...}:

{
  programs.steam.enable = true;
  programs.gamemode.enable = true;
  programs.gamescope = {
    enable = true;
    capSysNice = true; # Helps gamescope get real-time scheduling priority
  };
  
  environment.systemPackages = with pkgs; [

    # --------------------------------------------------------------------------
    # Gaming Utilities
    # --------------------------------------------------------------------------

    

    # --------------------------------------------------------------------------
    # Games from Nix Pkgs
    # --------------------------------------------------------------------------

    cataclysm-dda

  ];
}