# ============================================================================
# Sway
# ============================================================================

{ pkgs, ... }:

{
  programs.sway = 
  {
    enable = true;
    # For SwayFX:
    # package = pkgs.swayfx;
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
    wlr.enable = true;
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

    # Bar
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
    udiskie

    # Bluetooth GUI
    blueman

    # Audio
    pulseaudio
    pavucontrol
    
  ];

  # --------------------------------------------------------------------------
  # Storage
  # --------------------------------------------------------------------------

  services.udisks2.enable = true;
}
