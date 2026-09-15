{ ... }:

{
  imports = [
    ./git.nix
    ./kitty.nix
    ./nvim.nix
    ./packages.nix
    ./starship.nix
    ./zsh.nix
    ./vscode.nix
  ];

  home.username = "tyler";
  home.homeDirectory = "/home/tyler";

  home.stateVersion = "26.11";
}