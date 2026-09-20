{ pkgs, ... }:

{
  xdg.configFile."sway/config".source = ../../home/.config/sway/config;

  home.pointerCursor = {
    enable = true;
    package = pkgs.adwaita-icon-theme;
    name = "Adwaita";
    size = 24;
  };

  wayland.windowManager.sway = {
    xwayland = false;  # false if trying to use line 18, true if not
    config = {
      output."eDP-2".scale = "1";
      startup = [
        #{ command = "${pkgs.xwayland-satellite}/bin/xwayland-satellite :1"; }
      ];
    };
  };
  
}