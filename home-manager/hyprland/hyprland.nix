# ============================================================================
# Hyprland
# ============================================================================
{...}: {
  xdg.configFile."hypr/hyprland.lua".source =
    ../../home/.config/hypr/hyprland.lua;

  wayland.windowManager.hyprland = {
    enable = true;
    configType = "lua";
    xwayland.enable = true;
  };

  services.polkit-gnome.enable = true;
}
