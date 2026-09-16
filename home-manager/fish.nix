{ config, pkgs, ... }:

{
  programs.fish = {
    enable = true;

    shellAliases = {
      ddgr = "ddgr --colors eDngxy";
    };
  };
}
