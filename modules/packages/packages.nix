# ============================================================================
# Packages (This should be made more granular)
# ============================================================================

{pkgs, ...}:

{
  environment.systemPackages = with pkgs; 
  [
    # --------------------------------------------------------------------------
    # Shell / Terminal
    # --------------------------------------------------------------------------

    kitty
    starship
    fzf
    fastfetch
    btop
    direnv
    nvtopPackages.full
    proton-vpn
    taskwarrior3
    zellij
    stow

    # --------------------------------------------------------------------------
    # Editors (for TTY fallback only at system level)
    # --------------------------------------------------------------------------

    vim
    emacs

    # --------------------------------------------------------------------------
    # Graphics / Vulkan
    # --------------------------------------------------------------------------

    vulkan-tools
    # xwayland-satellite
    # mesa
    # mesa-demos

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
    # Secrets
    # --------------------------------------------------------------------------

    libsecret

    # --------------------------------------------------------------------------
    # Dependencies
    # --------------------------------------------------------------------------
    
    #gtk3
    #gtk4

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
    # VM/ISO Tools
    # -------------------------------------------------------------------------- 

    # VM
    distrobox
    # ISO
    caligula
    
  ];
}