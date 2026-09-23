# ============================================================================
# Neovim
# ============================================================================

{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
  };

  xdg.configFile."nvim/init.lua".source =
    ../../home/.config/nvim/init.lua;

  xdg.configFile."nvim/pack/nix/start/astrotheme".source =
    pkgs.vimPlugins.astrotheme;
}