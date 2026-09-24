# ============================================================================
# Waybar
# ============================================================================

{ ... }:

{
  programs.waybar = {
    enable = true;

    style = ../../home/.config/sway/waybar/style.css;
  };

  xdg.configFile."waybar/config.jsonc".source =
    ../../home/.config/sway/waybar/config.jsonc;
}