# ============================================================================
# Sway
# ============================================================================
{pkgs, ...}: {
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;

    extraPackages = with pkgs; [
      swayfx
    ];

    extraOptions = [
      "--unsupported-gpu"
    ];
  };

  # --------------------------------------------------------------------------
  # Sway Runtime Utilities
  # --------------------------------------------------------------------------

  environment.systemPackages = with pkgs; [
    autotiling
  ];
}
