{ config, pkgs, ... }:

{
  imports = [
    ./zsh.nix
    ./.config/kitty/kitty.nix
    ./.config/nvim/nvim.nix
  ];

  home.username = "tyler";
  home.homeDirectory = "/home/tyler";

  home.stateVersion = "26.11";
}