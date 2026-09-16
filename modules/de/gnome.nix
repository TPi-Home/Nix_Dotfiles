# ============================================================================
# Desktop / Display
# ============================================================================

{pkgs, ...}: 

{ 
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;
  services.gvfs.enable = true;

  environment.extraInit = ''
    export XDG_DATA_DIRS="$XDG_DATA_DIRS:${pkgs.gtk3}/share/gsettings-schemas/${pkgs.gtk3.name}"
  '';

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
}