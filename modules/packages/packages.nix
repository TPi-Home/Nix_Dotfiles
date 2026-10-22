# ============================================================================
# Packages (This should be made more granular)
# ============================================================================
{ pkgs, ... }: {

  # Steam Run is easier
  # programs.nix-ld.enable = true;

  environment.systemPackages = with pkgs; [
    # Shell / Terminal
    fzf
    fastfetch
    htop
    bottom
    atop
    direnv
    nvtopPackages.full
    taskwarrior3

    # Editors (for TTY fallback only at system level)
    vim
    emacs
    neovim
    

    # Graphics / Vulkan
    vulkan-tools

    # Utilities
    curl
    wget
    unzip
    unrar
    zip
    p7zip
    rsync
    fuse3
    rclone
    file
    tree
    man-db
    man-pages
    ncdu
    sc-im

    # Secrets
    libsecret

    # Nix Tools
    comma
    angrr
    statix
    nix-tree
    npc
    steam-run

    # Misc 
    graphviz

    # VM/ISO Tools
    pkgs.qemu_kvm

  ];
}
