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
    withUWSM = true;
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

    # Clipboard
    wl-clipboard

    # Removable devices
    udiskie

    # Bluetooth GUI
    blueman

    # Idle / lock
    hypridle
    hyprlock

    # Audio
    pulseaudio
    pavucontrol

    # TUI File Manager
    yazi
    
  ];

  # --------------------------------------------------------------------------
  # Storage
  # --------------------------------------------------------------------------

  services.udisks2.enable = true;
}