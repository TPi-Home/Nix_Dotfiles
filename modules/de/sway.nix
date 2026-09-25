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
  # Thunar & File System Backends
  # --------------------------------------------------------------------------

  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-volman       
    ];
  };

  programs.xfconf.enable = true;  # Saves Thunar's internal settings
  services.gvfs.enable = true;     # Core virtual file system (needed for trash & USB mounts)
  services.tumbler.enable = true;  # Generates image thumbnails in Thunar

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

  # PartOf=graphical-session.target
  programs.nm-applet.enable = true;

  # --------------------------------------------------------------------------
  # Bluetooth
  # --------------------------------------------------------------------------

  hardware.bluetooth = 
  {
    enable = true;
    powerOnBoot = true;
  };


  # PartOf=graphical-session.target
  services.blueman.enable = true;

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
  # Security & Permissions
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

    # Bluetooth
    bluetuith

    # Removable devices
    udiskie

    # Audio
    wiremix
    pavucontrol

    # File Manager
    nnn

    # Misc
    procps
    wlogout
  ];

}
