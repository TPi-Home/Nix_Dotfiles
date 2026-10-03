# ============================================================================
# Mango
# ============================================================================
{pkgs, ...}: {
  # --------------------------------------------------------------------------
  # Mango Wayland Compositor
  # --------------------------------------------------------------------------

  programs.mango.enable = true;

  environment.systemPackages = with pkgs; [
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

    # Bluetooth
    bluetuith
    blueman

    # Removable devices
    udiskie

    # Screen
    brightnessctl

    # Audio
    wiremix
    pavucontrol

    # File Manager
    nnn
    vimix-icon-theme

    # Logout GUI
    wlogout
  ];

  # --------------------------------------------------------------------------
  # Thunar & File System Backends
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

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  services.blueman.enable = true;

  # --------------------------------------------------------------------------
  # Wayland
  # --------------------------------------------------------------------------

  xdg.portal = {
    enable = true;
    wlr.enable = true;
  };

  # --------------------------------------------------------------------------
  # Security & Permissions
  # --------------------------------------------------------------------------

  security.pam.services.swaylock = {};
}
