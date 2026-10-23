# ============================================================================
# Session
# ============================================================================
{ ... }: {

  services.polkit-gnome.enable = true;

  xdg.portal.config = {
    common.default = [ "gtk" ];
    sway.default = [
      "wlr"
      "gtk"
    ];
    hyprland.default = [
      "hyprland"
      "gtk"
    ];
  };

  home.username = "tyler";
  home.homeDirectory = "/home/tyler";

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "code";
  };

  home.sessionPath = [
    "$HOME/.config/emacs/bin"
  ];

  fonts.fontconfig.enable = true;
}
