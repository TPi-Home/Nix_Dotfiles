# ============================================================================
# Sway
# ============================================================================
{...}: {
  xdg.configFile."sway/config".source = ../../home/.config/sway/config;

  xdg.configFile."swaynag/config".text = ''
    [logout]
    background=161718
    border=85befd
    border-bottom=85befd
    button-background=85befd
    text=c4c8c5
    button-text=161718
    edge=bottom
  '';

  wayland.windowManager.sway = {
    xwayland = true;

    config = {
      output."eDP-2".scale = "1";
    };
  };
}
