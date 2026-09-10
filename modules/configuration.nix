{ config, pkgs, ... }:

{
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
  # User (KEEP ROOT SH AS BASH )
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
  # System Packages (Migration to home incomplete)
  # ============================================================================

  environment.systemPackages = with pkgs; [

    # --------------------------------------------------------------------------
    # Shell / Terminal
    # --------------------------------------------------------------------------

    kitty
    zsh
    fish
    starship
    fzf
    television
    zsh-completions
    fastfetch
    btop
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
    wgetangrr
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
    # like windirstat but in the terminal:
    ncdu
    sops

    # --------------------------------------------------------------------------
    # AI
    # --------------------------------------------------------------------------

    ollama

    # --------------------------------------------------------------------------
    # Nix Tools (doubt I will install all of these, just reading documentation)
    # -------------------------------------------------------------------------- 

    # nix code formatter:
    alejandra
    # search nix packages:
    nix-search-tv
    # simply run a binary:
    comma
    # visualiz and cleanup gc-roots:
    nix-du
    angrr
    # check for nix anti-patterns:
    statix
    # nix diff:
    nvd
    # nix deps:
    nix-tree
    # what I wish I knew about when building bash scripts to rebuild:
    nixos-cli
    # auto enter env upon "cd dir" if I understand correctly:
    direnv
    # if I ever write derivations:
    nix-output-monitor
    # channel history: 
    npc



    # --------------------------------------------------------------------------
    # VM Tools
    # -------------------------------------------------------------------------- 

  ];
  
  # ============================================================================
  # System Version (just used for determining how NixOS formats the database)
  # ============================================================================

  system.stateVersion = "26.05";

}
