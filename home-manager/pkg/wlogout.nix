# ============================================================================
# WLogout
# ============================================================================

{ config, ... }:

{
  home.file.".config/wlogout/layout".source =
    ../../home/.config/wlogout/config.ini;

  home.file.".config/wlogout/style.css".source =
    ../../home/.config/wlogout/style.css;
}