{ pkgs, ... }:

{
  home.sessionVariables = {
    MOZ_ENABLE_WAYLAND = "0";
  };

  programs.firefox = {
    enable = true;
  };
}