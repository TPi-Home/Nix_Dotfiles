# ============================================================================
# Kitty
# ============================================================================
{...}: {
  home.file.".config/kitty/kitty.conf".source = ../../home/.config/kitty/kitty.conf;
  programs.kitty = {
    enable = true;
    enableGitIntegration = true;
    enableFishIntegration = true;
  };
}
