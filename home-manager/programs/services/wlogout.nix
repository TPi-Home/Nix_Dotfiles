# ============================================================================
# WLogout
# ============================================================================
{pkgs, ...}: {
  home.packages = with pkgs; [
    wlogout
  ];

  home.file.".config/wlogout/layout".source =
    ../../../home/.config/wlogout/config.json;

  home.file.".config/wlogout/style.css".source =
    ../../../home/.config/wlogout/style.css;
}
