# ============================================================================
# Session Setup
# ============================================================================

{pkgs, ...}:

{

  # --------------------------------------------------------------------------
  # Systemd and TTY
  # --------------------------------------------------------------------------

  # --------------------------------------------------------------------------
  # Wayland
  # --------------------------------------------------------------------------
  
  environment.sessionVariables = 
  {
    SWAY_UNSUPPORTED_GPU = "1";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };

  # File System for Removable Media
  environment.variables.GIO_EXTRA_MODULES = [ "${pkgs.gnome.gvfs}/lib/gio/modules" ];

  # Theme Support
  programs.dconf.enable = true;

  # Message Broker
  services.dbus.implementation = "broker";

}