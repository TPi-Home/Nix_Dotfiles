# ============================================================================
# Packages (This should be made more granular)
# ============================================================================

{pkgs, ...}:

{
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
    yazi

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
    godot-mono

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
    # Dependencies
    # --------------------------------------------------------------------------
    
    gtk3
    gtk4

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
}