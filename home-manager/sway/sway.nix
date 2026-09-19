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
    xwayland = true;  # if this option errors, use extraConfig = "xwayland disable";
    extraSessionCommands = ''
      export DISPLAY=:1
    '';
    config = {
      output."eDP-2".scale = "2";
      startup = [
        { command = "${pkgs.xwayland-satellite}/bin/xwayland-satellite :1"; }
      ];
    };
  };
  
}