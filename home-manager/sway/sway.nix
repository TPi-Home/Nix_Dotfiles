# ============================================================================
# Sway
# ============================================================================
{...}: {
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

  services.polkit-gnome.enable = true;
}
