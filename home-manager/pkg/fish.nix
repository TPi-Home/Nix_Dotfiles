# ============================================================================
# Fish
# ============================================================================
{
  config,
  pkgs,
  ...
}: {
  programs.bash.enable = true;

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
