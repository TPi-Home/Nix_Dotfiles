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
  # Waybar
  # --------------------------------------------------------------------------

  systemd.user.services.waybar.path = with pkgs; 
  [
    wlogout
    wleave
    pavucontrol
    waylogout
    pamixer
    procps
  ];

  # --------------------------------------------------------------------------
  # Power
  # --------------------------------------------------------------------------

  services.upower.enable = true;
  services.power-profiles-daemon.enable = true;

  # --------------------------------------------------------------------------
  # Networking
  # --------------------------------------------------------------------------

  programs.nm-applet.enable = true;

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
    swappy
    sway-contrib.grimshot

    # Clipboard
    wl-clipboard

    # Removable devices
    thunar-volman

    # Bluetooth
    bluetuith
    blueman

    # Removable devices
    udiskie

    # Audio
    wiremix
    pavucontrol

    # File Manager
    nnn
    thunar

    # Misc
    procps
    wlogout
  ];

  # --------------------------------------------------------------------------
  # Storage
  # --------------------------------------------------------------------------

  services.udisks2.enable = true;

}
