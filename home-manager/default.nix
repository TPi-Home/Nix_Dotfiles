# ============================================================================
# Imports/Variables/State Version
# ============================================================================

{ ... }:

{
  imports = [
    
    # Misc
    ./pkg/packages.nix

    # Terminal
    ./pkg/git.nix
    ./pkg/kitty.nix    

    # Editors
    ./pkg/vscode.nix
    ./pkg/helix.nix
    ./pkg/nvim.nix

    # Customization
    ./pkg/dconf.nix
    ./pkg/fish.nix
    ./pkg/starship.nix

    # Browsers
    ./pkg/firefox.nix
    ./pkg/chromium.nix

    # Game Dev
    ./pkg/unity_hub.nix

    # Desktop
    ./sway/sway.nix
    ./sway/waybar.nix

    # Application Launcher
    ./pkg/fuzzel.nix

    # Display Settings
    ./pkg/kanshi.nix

  ];

  home.username = "tyler";
  home.homeDirectory = "/home/tyler";
  
  home.sessionVariables = 
  {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };
  
  fonts.fontconfig.enable = true;

  home.stateVersion = "26.11";
}
