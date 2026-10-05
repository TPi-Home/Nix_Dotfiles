# ============================================================================
# Hyprland
# ============================================================================

{ pkgs, ... }:

{
  # --------------------------------------------------------------------------
  # Hyprland
  # --------------------------------------------------------------------------

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
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
    wlr.enable = true;
  };

  # --------------------------------------------------------------------------
  # Security
  # --------------------------------------------------------------------------

  security.pam.services.hyprlock = { };

  # --------------------------------------------------------------------------
  # Hyprland Runtime Utilities
  # --------------------------------------------------------------------------

  environment.systemPackages = with pkgs; 
  [
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

    # Audio
    wiremix
    pavucontrol

    # TUI File Manager
    nnn
    
  ];

  # --------------------------------------------------------------------------
  # Storage
  # --------------------------------------------------------------------------

  services.udisks2.enable = true;
}