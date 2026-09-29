# ============================================================================
# Neovim
# ============================================================================
{ pkgs, ... }: {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };

  # xdg.configFile."nvim/init.lua".source = ../../home/.config/nvim/init.lua;
  # just using astro nvim for now
  
  home.packages = with pkgs; [
  ];
}