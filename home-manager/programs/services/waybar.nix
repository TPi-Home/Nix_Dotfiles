# ============================================================================
# Waybar
# ============================================================================
{...}: {
  xdg.configFile = {
    "waybar/config-sway.jsonc".source =
      ../../../home/.config/sway/waybar/config.jsonc;

    "waybar/config-mango.jsonc".source =
      ../../../home/.config/mango/waybar/config.jsonc;

    "waybar/style-sway.css".source =
      ../../../home/.config/sway/waybar/style.css;

    "waybar/style-mango.css".source =
      ../../../home/.config/mango/waybar/style.css;
  };
}
