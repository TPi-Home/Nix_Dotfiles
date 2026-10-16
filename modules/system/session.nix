# ============================================================================
# Session Setup
# ============================================================================
{pkgs, ...}: {
  # ============================================================================
  # Power
  # ============================================================================

  services.logind.settings.Login = {
    HandleLidSwitch = "suspend";
    HandleLidSwitchExternalPower = "suspend";
    HandleLidSwitchDocked = "ignore";
  };

  systemd.sleep.settings.Sleep = {
    AllowSuspend = "yes";
    AllowHibernation = "no";
    AllowHybridSleep = "no";
    AllowSuspendThenHibernate = "no";
  };

  # ============================================================================
  # TTY
  # ============================================================================

  # ----------------------------------------------------------------------------
  # Wayland
  # ----------------------------------------------------------------------------

  xdg.portal = {
    enable = true;

    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-wlr
      xdg-desktop-portal-hyprland
    ];
  };

  environment.sessionVariables = {
    SWAY_UNSUPPORTED_GPU = "1";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };

  # ----------------------------------------------------------------------------
  # Shared Desktop Services
  # ----------------------------------------------------------------------------

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


  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  # ----------------------------------------------------------------------------
  # Shared Wayland Desktop Utilities
  # ----------------------------------------------------------------------------

  environment.systemPackages = with pkgs; [
    # Screenshots
    grim
    slurp
    swappy
    grimblast

    # Clipboard
    wl-clipboard

    # Color Selection
    hyprpicker

    # Screen
    brightnessctl

    # Removable devices
    udiskie

    # Bluetooth GUI
    blueman

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
