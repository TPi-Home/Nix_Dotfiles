{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # C / C++
    gcc
    clang-tools
    cmake
    ninja
    gnumake
    gdb
    lldb
    pkg-config

    # Rust
    rustup

    # C# / .NET
    dotnet-sdk
    roslyn-ls

    # Python
    python3
    pyright

    # Lua
    lua-language-server
    luarocks
    stylua

    # Nix
    nil

    # Other LSPs
    bash-language-server
    yaml-language-server
    vscode-langservers-extracted
    marksman
    taplo

    # Development utilities
    ripgrep
    fd
    tree-sitter
  ];
}