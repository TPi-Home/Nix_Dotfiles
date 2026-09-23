# ============================================================================
# Sway
# ============================================================================

{ pkgs, ... }:

{
  xdg.configFile."sway/config".source = ../../home/.config/sway/config;

  xdg.configFile."swaynag/config".text = ''
    [logout]
    background=161718
    border=85befd
    border-bottom=85befd
    button-background=85befd
    text=c4c8c5
    button-text=161718
    edge=bottom
  '';

  home.pointerCursor = 
  {
    enable = true;
    package = pkgs.adwaita-icon-theme;
    name = "Adwaita";
    size = 24;
  };

  wayland.windowManager.sway = 
  {
    xwayland = true;

    systemd.enable = false;

    config = {
      output."eDP-2".scale = "1";
    };
  };
}