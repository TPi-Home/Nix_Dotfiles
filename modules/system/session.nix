# ============================================================================
# Session Setup
# ============================================================================
{ pkgs, ... }: {
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
  # TTY / Wayland
  # ============================================================================

  xdg.portal = {
    enable = true;

    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-wlr
      xdg-desktop-portal-hyprland
    ];
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  # ----------------------------------------------------------------------------
  # Shared Desktop Services
  # ----------------------------------------------------------------------------

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
    kanshi
    nautilus
    file-roller
    grim
    slurp
    swappy
    grimblast
    wl-clipboard
    hyprpicker
    brightnessctl
    udiskie
    wiremix
    nnn
    vimix-icon-theme
  ];

  programs.dconf.enable = true;
  services.dbus.implementation = "broker";
}
