# ============================================================================
# Imports/Variables/State Version
# ============================================================================
{...}: {
  imports = [
    # Misc
    ./programs/misc/programs.nix
    # ./programs/misc/ollama.nix
    ./programs/misc/obs.nix

    # CLI
    ./programs/cli/git.nix
    ./programs/cli/fish.nix
    ./programs/cli/starship.nix

    # Terminals
    # ./programs/terminals/alacritty.nix
    # ./programs/terminals/kitty.nix
    ./programs/terminals/ghostty.nix

    # Editors
    ./programs/editors/vscode.nix
    ./programs/editors/helix.nix

    # Customization
    ./stylix/default.nix
    ./stylix/dconf.nix

    # Browsers
    ./programs/browsers/firefox.nix
    ./programs/browsers/chromium.nix
    ./programs/browsers/vivaldi.nix
    ./programs/browsers/qutebrowser.nix
    ./programs/browsers/librewolf.nix

    # Game Dev
    ./programs/misc/unity_hub.nix

    # Desktop
    ./sway/sway.nix
    ./sway/waybar.nix
    ./programs/services/wlogout.nix

    # Application Launcher
    ./programs/services/fuzzel.nix

    # Display Settings
    ./programs/services/kanshi.nix
  ];

  home.username = "tyler";
  home.homeDirectory = "/home/tyler";

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "code";
    GDK_DPI_SCALE = "1.0";
    # GDK_SCALE = "1.4";
    QT_SCALE_FACTOR=1.5;
  };

  fonts.fontconfig.enable = true;

  home.stateVersion = "26.11";
}
