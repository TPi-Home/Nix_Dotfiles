{ config, pkgs, ... }:

{
  imports = [
    # Core system
    ./system/boot.nix
    ./system/system.nix
    ./system/locale.nix
    ./system/networking.nix
    ./system/fonts.nix
    ./system/security.nix

    # Users
    ./users/tyler.nix

    # Gaming
    ./packages/gaming.nix

    # Hardware / services
    ./graphics/nvidia.nix
    ./audio/audio.nix

    # Display Manager
    #./dm/greetd.nix

    # Desktop / WM
    ./de/sway.nix

    # Software that is not directly enabled
    ./packages/packages.nix
  ];

  system.stateVersion = "26.05";
}
