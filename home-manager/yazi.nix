# ============================================================================
# Yazi
# ============================================================================
{ ... }:

{
  xdg.configFile."yazi/yazi.toml".source = ./dotfiles/yazi/yazi.toml;
  xdg.configFile."yazi/keymap.toml".source = ./dotfiles/yazi/keymap.toml;
  xdg.configFile."yazi/theme.toml".source = ./dotfiles/yazi/theme.toml;
  xdg.configFile."yazi/init.lua".source = ./dotfiles/yazi/init.lua;
}
