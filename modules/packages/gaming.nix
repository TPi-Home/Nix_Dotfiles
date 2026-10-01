# ============================================================================
# Gaming
# ============================================================================
{pkgs, ...}: {
  programs.steam = {
    enable = true;
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

    # --------------------------------------------------------------------------
    # Games from Nix Pkgs
    # --------------------------------------------------------------------------

    # I can probably start helping maintain this if it doesn't update soon
    (pkgs.cataclysm-dda.overrideAttrs (old: {
      env.NIX_CFLAGS_COMPILE =
        (old.env.NIX_CFLAGS_COMPILE or "")
        + " -Wno-error=sfinae-incomplete";
    }))
  ];
}
