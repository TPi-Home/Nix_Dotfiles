# ============================================================================
# Hyprland
# ============================================================================
{ config, ... }: {
  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    configType = "lua";
    extraConfig = builtins.readFile ../../home/.config/hypr/hyprland.lua;
    systemd.enable = true;
    xwayland.enable = true;
  };

  home.sessionVariables = {
    XCURSOR_SIZE = toString config.home.pointerCursor.size;
    HYPRCURSOR_SIZE = toString config.home.pointerCursor.size;
  };
}
