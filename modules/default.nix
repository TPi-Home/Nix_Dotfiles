{ config, pkgs, ... }:

{
  imports = [
    # Core system
    ./system/system.nix
    ./boot/boot.nix
    ./locale/locale.nix
    ./networking/networking.nix
    ./users/tyler.nix

    # Hardware / services
    ./nvidia/nvidia.nix
    ./audio/audio.nix

    # Desktop / WM
    ./de/gnome.nix

    # Software that is not directly enabled
    ./packages/packages.nix
  ];

  system.stateVersion = "26.05";
}
