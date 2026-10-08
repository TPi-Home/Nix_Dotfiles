# ============================================================================
# Hyprland
# ============================================================================

{pkgs, ...}: {
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    withUWSM = false;
  };

  environment.systemPackages = with pkgs; [

  ];
}
