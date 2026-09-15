{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
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
  # Neovim
  # ============================================================================

  programs.neovim = {
    enable = true;
    withPython3 = true;
    defaultEditor = true;
  };

  # ============================================================================
  # Shell / Prompt
  # ============================================================================

  programs.starship.enable = true;

  programs.zsh = {
    enable = true;

    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;

    setOptions = [
      "CORRECT"
    ];

    interactiveShellInit = ''

      autoload -Uz compinit
      compinit

      # fzf-tab must load after compinit and before plugins
      # that wrap Zsh widgets.
      source ${pkgs.zsh-fzf-tab}/share/fzf-tab/fzf-tab.plugin.zsh

      zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

      # Starship
      eval "$(starship init zsh)"

      # Default editor
      export EDITOR=nvim
      export VISUAL=nvim
    '';
  };

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
    taskwarrior3
    zellij

    # --------------------------------------------------------------------------
    # Editors
    # --------------------------------------------------------------------------

    vim
    emacs
    vscode

    # --------------------------------------------------------------------------
    # Version Control
    # --------------------------------------------------------------------------

    git
    git-lfs
    lazygit
    github-cli
    github-desktop

    # --------------------------------------------------------------------------
    # C / C++
    # --------------------------------------------------------------------------

    gcc
    clang-tools
    cmake
    ninja
    gnumake
    gdb
    lldb
    pkg-config

    # --------------------------------------------------------------------------
    # Rust
    # --------------------------------------------------------------------------
    rustup

    # --------------------------------------------------------------------------
    # .NET / C#
    # --------------------------------------------------------------------------

    dotnet-sdk
    roslyn-ls

    # --------------------------------------------------------------------------
    # Python
    # --------------------------------------------------------------------------

    python3
    pyright

    # --------------------------------------------------------------------------
    # Lua
    # --------------------------------------------------------------------------

    lua-language-server
    luarocks
    stylua

    # --------------------------------------------------------------------------
    # Nix
    # --------------------------------------------------------------------------

    nix
    nil

    # --------------------------------------------------------------------------
    # Other Language Servers
    # --------------------------------------------------------------------------

    bash-language-server
    yaml-language-server
    vscode-langservers-extracted
    marksman
    taplo

    # --------------------------------------------------------------------------
    # General Development Tools
    # --------------------------------------------------------------------------

    ripgrep
    fd
    jq
    tree-sitter
    devenv

    # --------------------------------------------------------------------------
    # Game Development
    # --------------------------------------------------------------------------

    unityhub
    tiled
    aseprite

    # --------------------------------------------------------------------------
    # AI
    # --------------------------------------------------------------------------

    ollama

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
    unzip
    unrar
    zip
    p7zip
    rsync
    rclone
    file
    tree
    wl-clipboard
    man-db
    man-pages
    stow
    # like windirstat but in the terminal
    ncdu
    sops
    nix-health

    # --------------------------------------------------------------------------
    # Games
    # --------------------------------------------------------------------------
    cataclysm-dda

    # --------------------------------------------------------------------------
    # Nix tools
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

  ];
  
  # ============================================================================
  # System Version (just used for determining how NixOS formats the database)
  # ============================================================================

  system.stateVersion = "26.05";

}
