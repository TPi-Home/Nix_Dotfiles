{ config, pkgs, ... }:

{
  imports = [
    ../hosts/generic/hardware-configuration.nix
  ];

  # ============================================================================
  # Boot
  # ============================================================================

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # ============================================================================
  # Networking
  # ============================================================================

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  networking.networkmanager.wifi.macAddress = "random";
  networking.firewall.enable = true;

  # ============================================================================
  # Locale / Time
  # ============================================================================

  time.timeZone = "America/Indiana/Indianapolis";
  i18n.defaultLocale = "en_US.UTF-8";

  # ============================================================================
  # Desktop / Display
  # ============================================================================

  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;
  services.gvfs.enable = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # ============================================================================
  # WM
  # ============================================================================
    
  #programs.sway.enable = true;

  # ============================================================================
  # NVIDIA / Graphics
  # ============================================================================

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    open = true;
    modesetting.enable = true;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # ============================================================================
  # Audio
  # ============================================================================

  services.pulseaudio.enable = false;

  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # ============================================================================
  # Input / System Services
  # ============================================================================

  services.libinput.enable = true;
  services.flatpak.enable = true;

  # ============================================================================
  # Applications
  # ============================================================================

  programs.firefox.enable = true;
  programs.steam.enable = true;

  # ============================================================================
  # User
  # ============================================================================

  users.users.tyler = {
    isNormalUser = true;
    description = "tyler";
    shell = pkgs.zsh;

    extraGroups = [
      "wheel"
      "networkmanager"
    ];
  };

  # ============================================================================
  # Nix
  # ============================================================================

  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # ============================================================================
  # System Packages
  # ============================================================================

  environment.systemPackages = with pkgs; [

    # --------------------------------------------------------------------------
    # Shell / Terminal
    # --------------------------------------------------------------------------

    kitty
    zsh
    starship
    fzf
    zsh-completions
    fastfetch
    btop
    direnv
    nvtopPackages.full
    proton-vpn-cli
    dconf

    # --------------------------------------------------------------------------
    # Editors
    # --------------------------------------------------------------------------

    vim
    emacs
    vscode

    # --------------------------------------------------------------------------
    # Game Development
    # --------------------------------------------------------------------------

    unityhub
    tiled
    aseprite

    # --------------------------------------------------------------------------
    # Graphics / Vulkan
    # --------------------------------------------------------------------------

    vulkan-tools
    # mesa
    # mesa-demos

    # --------------------------------------------------------------------------
    # GUI Applications
    # --------------------------------------------------------------------------

    gimp
    kdePackages.okular
    vlc
    qbittorrent
    gnome-calculator
    signal-desktop
    thunderbird
    obsidian

    # --------------------------------------------------------------------------
    # Utilities
    # --------------------------------------------------------------------------

    curl
    wget
    unzip
    unrar
    zip
    p7zip
    rsync
    rclone
    file
    tree
    man-db
    man-pages
    # like windirstat but in the terminal
    ncdu
    sops
    
    # ============================================================================
    # Games
    # ============================================================================
    cataclysm-dda

  ];
  
  # ============================================================================
  # System Version (just used for determining how NixOS formats the database)
  # ============================================================================

  system.stateVersion = "26.05";

}
