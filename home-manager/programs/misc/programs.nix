# ============================================================================
# Miscellaneous Programs and Packages
# ============================================================================
{
  pkgs,
  lib,
  ...
}:
{
  home.packages = with pkgs; [
    # TUI
    fetch
    foot

    # Version Control
    git-lfs
    lazygit

    # C / C++
    (lib.hiPrio gcc)
    clang
    clang-tools
    meson
    cmake
    ninja
    gnumake
    gdb
    lldb
    pkg-config
    aflplusplus
    ncurses.dev
    ncurses

    # Rust
    rustup

    # .NET / C#
    dotnet-sdk
    roslyn-ls

    # Python
    python3
    python3Packages.pip
    pyright
    ruff

    # Lua
    lua-language-server
    lua
    luarocks
    stylua

    # Haskell
    ghc
    cabal-install
    stack
    haskell-language-server
    hlint
    fourmolu
    ormolu

    # Go
    go
    gopls
    golangci-lint
    delve

    # Common Lisp
    sbcl
    roswell

    # Nix
    nixd
    nixfmt

    # Other Language Servers
    bash-language-server
    yaml-language-server
    vscode-langservers-extracted
    marksman
    taplo

    # General Development Tools
    ripgrep
    fd
    jq
    tree-sitter
    devenv
    prettier
    gdu

    # Game Development
    tiled
    aseprite
    godot-mono

    # Games
    openrct2
    openmw
    cataclysm-dda

    # GUI Applications
    gimp
    kdePackages.okular
    vlc
    qbittorrent
    signal-desktop
    thunderbird
    obsidian
    discord
    libreoffice
  ];
}
