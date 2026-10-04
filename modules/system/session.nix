# ============================================================================
# Session Setup
# ============================================================================
{pkgs, ...}: {
  # --------------------------------------------------------------------------
  # Wayland
  # --------------------------------------------------------------------------

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

  # --------------------------------------------------------------------------
  # Shared Wayland Desktop Utilities
  # --------------------------------------------------------------------------

  environment.systemPackages = with pkgs; [
    fuzzel
    (waybar.overrideAttrs (old: {
      mesonFlags = old.mesonFlags ++ ["-Dmango=true"];
    }))
    libnotify
    mako
    grim
    slurp
    swappy
    sway-contrib.grimshot
    wl-clipboard
    bluetuith
    blueman
    udiskie
    brightnessctl
    swaybg
    swayidle
    swaylock
    wiremix
    pavucontrol
    nnn
    vimix-icon-theme
  ];

  # File System for Removable Media
  environment.variables.GIO_EXTRA_MODULES = [
    "${pkgs.gnome.gvfs}/lib/gio/modules"
  ];

  # Theme Support
  programs.dconf.enable = true;

  # Message Broker
  services.dbus.implementation = "broker";
}
