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
    xwayland = false;  # if this option errors, use extraConfig = "xwayland disable";
    config = {
      output."eDP-2".scale = "2";
      startup = [
        { command = "${pkgs.xwayland-satellite}/bin/xwayland-satellite :1"; }
      ];
    };
  };
  
}