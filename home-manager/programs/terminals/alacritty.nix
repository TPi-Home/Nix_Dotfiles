# ============================================================================
# Alacritty
# ============================================================================
{pkgs, ...}: {
  programs.alacritty = {
    enable = true;
    #enableGitIntegration = true;
    #extraConfig = builtins.readFile ../../../home/.config/kitty/kitty.conf;
  };
}
