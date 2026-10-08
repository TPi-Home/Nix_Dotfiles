# ============================================================================
# Hyprland
# ============================================================================
{pkgs, ...}: {
  xdg.configFile."hypr/hyprland.conf".source =
    ../../home/.config/hypr/hyprland.conf;

  home.pointerCursor = {
    enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 36;
  };

  wayland.windowManager.hyprland = {
    enable = true;
    configType = "hyprlang";
    xwayland.enable = true;
  };

  services.polkit-gnome.enable = true;
}
