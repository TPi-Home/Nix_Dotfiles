# ============================================================================
# Waybar
# ============================================================================

{ ... }:

{
  programs.waybar = {
    enable = true;
    systemd.enable = true;

    style = ../../home/.config/waybar/style.css;
  };

  xdg.configFile."waybar/config.jsonc".source =
    ../../home/.config/waybar/config.jsonc;
}