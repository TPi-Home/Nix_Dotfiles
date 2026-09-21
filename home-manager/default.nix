# ============================================================================
# Imports/Variables/State Version
# ============================================================================

{ ... }:

{
  imports = [
    # Misc
    ./git.nix
    ./kitty.nix
    ./nvim.nix
    ./packages.nix
    ./starship.nix
    ./fish.nix
    ./vscode.nix
    ./helix.nix

    # Browsers
    ./firefox.nix
    ./chromium.nix

    # Game Dev
    ./unity_hub.nix

    # Desktop
    ./sway/sway.nix
    ./sway/waybar.nix

    # Application Launcher
    ./fuzzel.nix

    # Hardware IO
    ./kanshi.nix
    
  ];

  home.username = "tyler";
  home.homeDirectory = "/home/tyler";
  
  fonts.fontconfig.enable = true;

  home.stateVersion = "26.11";
}
