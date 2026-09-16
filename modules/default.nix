{ config, pkgs, ... }:

{
  imports = [
    # Core system
    ./system/system.nix
    ./boot/boot.nix
    ./system/locale.nix
    ./networking/networking.nix
    ./users/tyler.nix
    ./system/fonts.nix
    ./system/security.nix

    # Gaming
    ./packages/gaming.nix
    
    # Hardware / services
    ./graphics/nvidia.nix
    ./audio/audio.nix

    # Display Manager
    ./dm/greetd.nix

    # Desktop / WM
    ./de/sway.nix

    # Software that is not directly enabled
    ./packages/packages.nix
  ];

  system.stateVersion = "26.05";
}
