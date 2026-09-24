# ============================================================================
# Sway
# ============================================================================

{ pkgs, ... }:

{
  programs.sway = 
  {
    enable = true;
    wrapperFeatures.gtk = true;

    extraPackages = with pkgs; 
    [
      swayidle
      swaylock
      swaybg
      swayfx
    ];

    extraOptions = 
    [
      "--unsupported-gpu"
    ];
  };

  # --------------------------------------------------------------------------
  # Power
  # --------------------------------------------------------------------------

  services.upower.enable = true;
  services.power-profiles-daemon.enable = true;

  # --------------------------------------------------------------------------
  # Networking
  # --------------------------------------------------------------------------

  # programs.nm-applet.enable = true;

  # --------------------------------------------------------------------------
  # Bluetooth
  # --------------------------------------------------------------------------

  hardware.bluetooth = 
  {
    enable = true;
    powerOnBoot = true;
  };

  # --------------------------------------------------------------------------
  # Wayland
  # --------------------------------------------------------------------------

  xdg.portal = 
  {
    enable = true;

    # Application -> XDG Desktop Portal -> wlroots portal backend -> 
    # PipeWire -> Back to Application
    wlr.enable = true;

    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];

    config = {
      sway = {
        default = [ "gtk" ];
      };
    };
  };

  # --------------------------------------------------------------------------
  # Environment 
  # --------------------------------------------------------------------------

  environment.sessionVariables = 
  {
    SWAY_UNSUPPORTED_GPU = "1";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };

  programs.qt5ct.enable = true;

  # --------------------------------------------------------------------------
  # Security
  # --------------------------------------------------------------------------

  security.pam.services.swaylock = { };

  # --------------------------------------------------------------------------
  # Sway Runtime Utilities
  # --------------------------------------------------------------------------

  environment.systemPackages = with pkgs; 
  [
    # Launcher
    fuzzel

    # Status Bar
    waybar

    # Notifications
    libnotify
    mako

    # Screenshots
    grim
    slurp
    sway-contrib.grimshot

    # Clipboard
    wl-clipboard

    # Removable devices
    udiskie

    # Bluetooth GUI
    bluetuith

    # Audio
    wiremix

    # TUI File Manager
    nnn

    # Misc
    procps
  ];

  # --------------------------------------------------------------------------
  # Storage
  # --------------------------------------------------------------------------

  services.udisks2.enable = true;

  # --------------------------------------------------------------------------
  # Wayland Session Management
  # --------------------------------------------------------------------------

  programs.uwsm =
  {
    enable = true;
    waylandCompositors = 
    {
      sway = 
      {
        prettyName = "Sway";
        comment = "Sway compositor managed by UWSM";
        binPath = "/run/current-system/sw/bin/sway";
      };
    };
  };
}
