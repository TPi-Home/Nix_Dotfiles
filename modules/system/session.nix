# ============================================================================
# Session Setup
# ============================================================================
{pkgs, ...}: {
  # ============================================================================
  # TTY
  # ============================================================================
  
  # ============================================================================
  # Wayland
  # ============================================================================

  xdg.portal = {
    enable = true;

    # Application -> XDG Desktop Portal -> wlroots portal backend ->
    # PipeWire -> Back to Application
    wlr.enable = true;
  };

  environment.sessionVariables = {
    SWAY_UNSUPPORTED_GPU = "1";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };

  # --------------------------------------------------------------------------
  # Waybar
  # --------------------------------------------------------------------------

  systemd.user.services.waybar.path = with pkgs; [
    wlogout
    wleave
    pavucontrol
    waylogout
    pamixer
    procps
  ];

  
  # --------------------------------------------------------------------------
  # Shared Desktop Services
  # --------------------------------------------------------------------------

  programs.thunar = {
    enable = true;
    plugins = with pkgs; [
      thunar-archive-plugin
      thunar-volman
    ];
  };

  services.gvfs.enable = true;
  services.tumbler.enable = true;
  programs.xfconf.enable = true;

  services.upower.enable = true;
  services.power-profiles-daemon.enable = true;

  programs.nm-applet.enable = true;

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  services.blueman.enable = true;

  security.pam.services.swaylock = {};
  security.pam.services.hyprlock = { };

  # --------------------------------------------------------------------------
  # Shared Wayland Desktop Utilities
  # --------------------------------------------------------------------------

  environment.systemPackages = with pkgs; [
    # Launcher
    fuzzel

    # Bar
    waybar

    # Notifications
    libnotify
    mako

    # Screenshots
    grim
    slurp
    swappy
    grimblast
    
    # Wallpaper
    hyprpaper
    swaybg
    sway-contrib.grimshot

    # Clipboard
    wl-clipboard

    # Color Selection
    hyprpicker

    # Lighting
    hyprsunset

    # Removable devices
    udiskie

    # Bluetooth GUI
    blueman

    # Idle / lock
    hypridle
    hyprlock
    swayidle
    swaylock

    # Audio
    wiremix
    pavucontrol

    # TUI File Manager
    nnn

    # Thunar Extras
    vimix-icon-theme
  ];


  # Theme Support
  programs.dconf.enable = true;

  # Message Broker
  services.dbus.implementation = "broker";
}