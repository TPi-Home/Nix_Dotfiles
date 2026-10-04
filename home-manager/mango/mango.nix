# ============================================================================
# Mango
# ============================================================================
{pkgs, ...}: {
  xdg.configFile."mango/config.conf".source =
    ../../home/.config/mango/config.conf;

  home.pointerCursor = {
    enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 24;
  };

  services.polkit-gnome.enable = true;
}
