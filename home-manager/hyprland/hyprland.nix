# ============================================================================
# Hyprland
# ============================================================================
{pkgs, ...}: {
  xdg.configFile."hypr/hyprland.conf".source = ../../home/.config/hypr/hyprland.conf;

  wayland.windowManager.hyprland = {
    enable = true;

    xwayland.enable = true;

    settings = {
      env = [
        "XCURSOR_THEME,Bibata-Modern-Ice"
        "XCURSOR_SIZE,36"
      ];

      monitor = [
        "eDP-2,preferred,auto,1"
      ];
    };
  };

  services.polkit-gnome.enable = true;
}