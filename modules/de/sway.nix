# ============================================================================
# Sway
# ============================================================================

{ pkgs, ... }:

{
  # --------------------------------------------------------------------------
  # Sway
  # --------------------------------------------------------------------------

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;

    extraPackages = with pkgs; [
      swayidle
      swaylock
      swaynag
    ];
  };


  # --------------------------------------------------------------------------
  # Power
  # --------------------------------------------------------------------------

  services.upower.enable = true;


  # --------------------------------------------------------------------------
  # Networking
  # --------------------------------------------------------------------------

  networking.networkmanager.enable = true;
  programs.nm-applet.enable = true;


  # --------------------------------------------------------------------------
  # Bluetooth
  # --------------------------------------------------------------------------

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  # --------------------------------------------------------------------------
  # Audio
  # --------------------------------------------------------------------------

  services.pipewire = {
    enable = true;

    alsa = {
      enable = true;
      support32Bit = true;
    };

    pulse.enable = true;
  };


  # --------------------------------------------------------------------------
  # Wayland
  # --------------------------------------------------------------------------

  xdg.portal = {
    enable = true;
    wlr.enable = true;
  };


  # --------------------------------------------------------------------------
  # Security
  # --------------------------------------------------------------------------

  security.polkit.enable = true;

  services.gnome.gnome-keyring.enable = true;

  security.pam.services.swaylock = {};


  # --------------------------------------------------------------------------
  # Sway Runtime Utilities
  # --------------------------------------------------------------------------

  environment.systemPackages = with pkgs; [
    # Launcher
    wofi

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

    # Night light
    #gammastep

    # Bluetooth GUI
    blueman
  ];


  # --------------------------------------------------------------------------
  # Storage
  # --------------------------------------------------------------------------

  services.udisks2.enable = true;
}