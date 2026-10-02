# ============================================================================
# Imports/Variables/State Version
# ============================================================================
{...}: {
  imports = [
    # Misc
    ./pkg/packages.nix

    # Terminal
    ./pkg/git.nix
    ./pkg/kitty.nix

    # Editors
    ./pkg/vscode.nix
    ./pkg/helix.nix

    # Customization
    ./pkg/fish.nix
    ./pkg/starship.nix
    ./stylix/default.nix
    ./stylix/dconf.nix

    # Browsers
    ./pkg/firefox.nix
    ./pkg/chromium.nix
    ./pkg/vivaldi.nix
    ./pkg/qutebrowser.nix
    ./pkg/librewolf.nix

    # Game Dev
    ./pkg/unity_hub.nix

    # Desktop
    ./sway/sway.nix
    ./sway/waybar.nix
    ./pkg/wlogout.nix

    # Application Launcher
    ./pkg/fuzzel.nix

    # Display Settings
    ./pkg/kanshi.nix
  ];

  home.username = "tyler";
  home.homeDirectory = "/home/tyler";

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "code";
    GDK_DPI_SCALE = "1.4";
    # GDK_SCALE = "1.4";
  };

  fonts.fontconfig.enable = true;

  home.stateVersion = "26.11";
}
