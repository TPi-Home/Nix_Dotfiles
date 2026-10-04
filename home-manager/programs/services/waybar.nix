# ============================================================================
# Waybar
# ============================================================================
{...}: {
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    systemd.targets = ["sway-session.target"];
  };

  xdg.configFile = {
    "waybar/config".source =
      ../../../home/.config/sway/waybar/config.jsonc;

    "waybar/style.css".source =
      ../../../home/.config/sway/waybar/style.css;
  };
}
