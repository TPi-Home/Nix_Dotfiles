# ============================================================================
# Hyprland
# ============================================================================

{pkgs, ...}: {
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;

    # The graphical session is wrapped by systemd-run in tuigreet.
    # Do not add Hyprland's own UWSM session or systemd integration.
    withUWSM = false;
    package = pkgs.hyprland.override {
      withSystemd = false;
    };
  };

  environment.systemPackages = with pkgs; [

  ];
}
