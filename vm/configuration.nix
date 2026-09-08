{ config, pkgs, ... }:

{
  # Expose the LXQt Wayland session package to your display manager
  services.displayManager.sessionPackages = [ pkgs.lxqt.lxqt-wayland-session ];

  # ============================================================================
  # VM
  # ============================================================================
  # NOTE TO SELF: VM VARIENT FLAG HERE CAN BE SET TO vmVariantWithBootloader for a persistent install
  virtualisation.vmVariant = {
    virtualisation = {
      memorySize = 4096;
      cores = 2;
      diskSize = 20 * 1024;
    };
  };

  # ============================================================================
  # Boot
  # ============================================================================

  # Only needed for persistent installs
  #boot.loader.grub.device = "/dev/vda";

  # ============================================================================
  # Networking
  # ============================================================================

  networking.hostName = "nix-test";
  networking.networkmanager.enable = true;

  # ============================================================================
  # User
  # ============================================================================

  users.users.tyler = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "input"];
    initialPassword = "test";
  };

  security.sudo.wheelNeedsPassword = false;

  # ============================================================================
  # Shell
  # ============================================================================

  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;

  # ============================================================================
  # Desktop
  # ============================================================================

  services.xserver.enable = true;

  services.xserver.desktopManager.lxqt.enable = true;
  

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };



  # ============================================================================
  # Environment
  # ============================================================================

  environment.variables = {
    EDITOR = "nvim";

    # Work around invisible hardware cursors in virtualized graphics.
    KWIN_FORCE_SW_CURSOR = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
    WLR_RENDERER = "pixman";
  };

  # ============================================================================
  # Testing utilities
  # ============================================================================

  environment.systemPackages = with pkgs; [
    bash
    coreutils
    curl
    git
    jq
    ripgrep
    vim
    neovim
    wget
    lxqt.lxqt-wayland-session
    labwc
  ];

  system.stateVersion = "25.11";

}