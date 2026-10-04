# ============================================================================
# Waybar
# ============================================================================
{pkgs, ...}: {
  programs.waybar = {
    enable = true;

    package = pkgs.waybar.overrideAttrs (old: {
      mesonFlags = old.mesonFlags ++ ["-Dmango=true"];
    });

    style = ../../home/.config/mango/waybar/style.css;
  };

  xdg.configFile."waybar/config".source =
    ../../home/.config/mango/waybar/config.jsonc;
}
