# ============================================================================
# Imports/Variables/State Version
# ============================================================================
{inputs, ...}: {
  imports = [
    inputs.noctalia.homeModules.default
    # Misc
    ./programs/misc/programs.nix
    # ./programs/misc/ollama.nix
    # ./programs/misc/obs.nix

    # CLI
    ./programs/cli/git.nix
    ./programs/cli/fish.nix
    ./programs/cli/starship.nix

    # Terminals

    ./programs/terminals/ghostty.nix

    # Editors
    ./programs/editors/vscode.nix
    ./programs/editors/helix.nix

    # Customization
    ./stylix/default.nix
    ./stylix/dconf.nix

    # Browsers
    ./programs/browsers/firefox.nix
    ./programs/browsers/helium.nix
    ./programs/browsers/qutebrowser.nix

    # Game Dev
    ./programs/misc/unity_hub.nix

    # Desktop
    ./sway/sway.nix
    ./hyprland/hyprland.nix

    # Display Settings
    ./programs/services/kanshi.nix

    # Defaults
    ./programs/mime.nix
  ];

  xdg.portal.config = {
    common.default = ["gtk"];
    sway.default = ["wlr" "gtk"];
    hyprland.default = ["hyprland" "gtk"];
  };

  programs.noctalia.enable = true;

  home.username = "tyler";
  home.homeDirectory = "/home/tyler";

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "code";
    GDK_DPI_SCALE = "1.0";
    # GDK_SCALE = "1.4";
    QT_SCALE_FACTOR = 1.5;
  };

  fonts.fontconfig.enable = true;

  home.stateVersion = "26.11";
}
