# ============================================================================
# Waybar
# ============================================================================
{...}: {
  programs.waybar = {
    enable = true;

    style = ../../home/.config/waybar/style.css;
  };

  xdg.configFile."waybar/config.jsonc".source =
    ../../home/.config/waybar/config.jsonc;

  xdg.configFile."waybar/sway.jsonc".source =
    ../../home/.config/waybar/sway.jsonc;

  xdg.configFile."waybar/hyprland.jsonc".source =
    ../../home/.config/waybar/hyprland.jsonc;
}
