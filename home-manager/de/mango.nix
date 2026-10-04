# ============================================================================
# Mango
# ============================================================================
{...}: {
  xdg.configFile."mango/config.conf".source =
    ../../home/.config/mango/config.conf;

  services.mangobar = {
    enable = true;
    systemdTarget = "mango-session.target";
    configFile = ../../home/.config/mangobar/config.jsonc;
  };

  xdg.configFile."mangobar/style.css".source =
    ../../home/.config/mangobar/style.css;
}
