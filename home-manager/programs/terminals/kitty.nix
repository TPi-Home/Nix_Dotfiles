# ============================================================================
# Kitty
# ============================================================================
{pkgs, ...}: {
  programs.kitty = {
    enable = true;
    enableGitIntegration = true;
    extraConfig = builtins.readFile ../../../home/.config/kitty/kitty.conf;
  };
}
