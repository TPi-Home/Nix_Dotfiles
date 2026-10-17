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
    ./programs/cli/tmux.nix

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
    ./programs/browsers/qutebrowser.nix
    ./programs/browsers/vivaldi.nix

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

  xdg.configFile."noctalia/palettes/AstroDark.json".source =
    ../home/.config/noctalia/palettes/AstroDark.json;

  home.username = "tyler";
  home.homeDirectory = "/home/tyler";

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "code";
  };

  fonts.fontconfig.enable = true;

  home.stateVersion = "26.11";
}
