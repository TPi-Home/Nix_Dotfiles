# ============================================================================
# Desktop / Display
# ============================================================================

{...}: 

{ 
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;
  services.gvfs.enable = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
}