# ============================================================================
# Waybar
# ============================================================================
{...}: {
  xdg.configFile = {
    "waybar/config-sway.jsonc".source =
      ../../../home/.config/sway/waybar/config.jsonc;

    "waybar/style-sway.css".source =
      ../../../home/.config/sway/waybar/style.css;
  };
}
