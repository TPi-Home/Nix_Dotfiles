{ ... }:

{
  imports = [
    ./git.nix
    ./kitty.nix
    ./nvim.nix
    ./packages.nix
    ./starship.nix
    ./fish.nix
    ./vscode.nix
    ./helix.nix
    ./firefox.nix
    ./chromium.nix
    ./unity.nix

    # Desktop
    ./sway/sway.nix
    ./sway/waybar.nix

    # Application Launcher
    ./fuzzel.nix
  ];

  home.username = "tyler";
  home.homeDirectory = "/home/tyler";
  
  fonts.fontconfig.enable = true;

  home.stateVersion = "26.11";
}
