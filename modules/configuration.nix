{ config, pkgs, ... }:

{
  imports = [
    ./de/gnome.nix
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
  
  programs.fish.enable = true;
  users.users.tyler = {
    isNormalUser = true;
    description = "tyler";
    shell = pkgs.fish;

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
    starship
    fzf
    #zsh-completions
    fastfetch
    btop
    direnv
    nvtopPackages.full
    proton-vpn
    dconf
    taskwarrior3
    zellij

    # --------------------------------------------------------------------------
    # Editors (for TTY fallback only at system level)
    # --------------------------------------------------------------------------

    vim
    emacs

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
    discord

    # --------------------------------------------------------------------------
    # Utilities
    # --------------------------------------------------------------------------

    curl
    wget
    angrr
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
    #nixos-cli
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
