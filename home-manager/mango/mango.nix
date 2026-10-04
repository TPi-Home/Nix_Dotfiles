# ============================================================================
# Mango
# ============================================================================
{pkgs, ...}: {
  xdg.configFile."mango/config.conf".source =
    ../../home/.config/mango/config.conf;

  programs.waybar = {
    enable = true;

    package = pkgs.waybar.overrideAttrs (old: {
      mesonFlags = old.mesonFlags ++ [ "-Dmango=true" ];
    });

    style = ../../home/.config/mango/waybar/style.css;
  };

  xdg.configFile."waybar/config.jsonc".source =
    ../../home/.config/mango/waybar/config.jsonc;

  home.pointerCursor = {
    enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 24;
  };

  services.polkit-gnome.enable = true;
}
