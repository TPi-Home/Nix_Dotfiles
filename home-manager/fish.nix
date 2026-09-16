{ config, pkgs, ... }:

{
  programs.fish = {
    enable = true;

    interactiveShellInit = ''
        set -g fish_greeting
      '';

    shellAliases = {
      ddgr = "ddgr --colors eDngxy";
    };
  };
}
