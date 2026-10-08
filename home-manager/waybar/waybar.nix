# ============================================================================
# Waybar
# ============================================================================
{...}: {
  programs.waybar.enable = false;

  xdg.configFile."waybar/sway.jsonc".source =
    ../../home/.config/waybar/sway.jsonc;

  xdg.configFile."waybar/hyprland.jsonc".source =
    ../../home/.config/waybar/hyprland.jsonc;

  xdg.configFile."waybar/style.css".source =
    ../../home/.config/waybar/style.css;
}
