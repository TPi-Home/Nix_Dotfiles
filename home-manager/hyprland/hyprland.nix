# ============================================================================
# Hyprland
# ============================================================================
{...}: {
  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    configType = "lua";
    extraConfig = builtins.readFile ../../home/.config/hypr/hyprland.lua;
    systemd.enable = false;
    xwayland.enable = true;
  };

  services.polkit-gnome.enable = true;
}
