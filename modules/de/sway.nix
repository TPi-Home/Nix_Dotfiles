# ============================================================================
# Sway
# ============================================================================
{pkgs, ...}: {
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;

    extraPackages = with pkgs; [
      swayidle
      swaylock
      swaybg
      swayfx
    ];

    extraOptions = [
      "--unsupported-gpu"
    ];
  };

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

  services.gvfs.enable = true; # Core virtual file system (needed for trash & USB mounts)
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

  # PartOf=graphical-session.target
  programs.nm-applet.enable = true;

  # --------------------------------------------------------------------------
  # Bluetooth
  # --------------------------------------------------------------------------

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  # PartOf=graphical-session.target
  services.blueman.enable = true;

  # --------------------------------------------------------------------------
  # Security & Permissions
  # --------------------------------------------------------------------------

  security.pam.services.swaylock = {};

  # --------------------------------------------------------------------------
  # Sway Runtime Utilities (now in session.nix)
  # --------------------------------------------------------------------------

  environment.systemPackages = with pkgs; [

  ];
}
