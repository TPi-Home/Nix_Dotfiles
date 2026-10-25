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
    file
    tree
    man-db
    man-pages
    ncdu
    sc-im

    # Dependencies
    zlib

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

    # VM/ISO
    pkgs.qemu_kvm

    # Server/Android Tools
    simg2img
    android-tools
  ];
}
