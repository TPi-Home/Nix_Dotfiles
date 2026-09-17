{ pkgs, ... }:

{
  xdg.configFile."sway/config".source = ../../home/.config/sway/config;

  home.pointerCursor = {
    enable = true;
    package = pkgs.adwaita-icon-theme;
    name = "Adwaita";
    size = 32;
  };
}