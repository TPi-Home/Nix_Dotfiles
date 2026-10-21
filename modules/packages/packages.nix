# ============================================================================
# Packages (This should be made more granular)
# ============================================================================
{ pkgs, ... }: {

  programs.nix-ld.enable = true;

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
    kakoune

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
    rclone
    file
    tree
    man-db
    man-pages
    ncdu
    sops
    sc-im

    # Secrets
    libsecret

    # Nix Tools
    nix-search-tv
    comma
    nix-du
    angrr
    statix
    nvd
    nix-tree
    nix-output-monitor
    npc
    steam-run

    # VM/ISO Tools
    distrobox
    caligula
  ];
}
