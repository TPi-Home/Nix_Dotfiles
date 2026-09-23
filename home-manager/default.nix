# ============================================================================
# Imports/Variables/State Version
# ============================================================================

{ ... }:

{
  imports = [
    
    # Misc
    ./packages.nix

    # Terminal
    ./git.nix
    ./kitty.nix    

    # Editors
    ./vscode.nix
    ./helix.nix
    ./nvim.nix

    # Customization
    ./dconf.nix
    ./fish.nix
    ./starship.nix

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

    # Display Settings
    ./kanshi.nix

  ];

  home.username = "tyler";
  home.homeDirectory = "/home/tyler";
  
  home.sessionVariables = 
  {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  home.file.".config/uwsm/env".text = 
  ''
    export GBM_BACKEND=nvidia-drm
    export __GLX_VENDOR_LIBRARY_NAME=nvidia
    export WLR_NO_HARDWARE_CURSORS=1
  '';



  fonts.fontconfig.enable = true;

  home.stateVersion = "26.11";
}
