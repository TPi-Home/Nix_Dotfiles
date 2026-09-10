{ config, pkgs, ... }:

{
  # I should pull this from my github
  home.file.".config/kitty/kitty.conf".source = ../home/.config/kitty/kitty.conf;
}