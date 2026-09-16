{ config, pkgs, ... }:

{
  imports = [
    ./system/system.nix
    ./boot/boot.nix
    ./locale/locale.nix
    ./nvidia/nvidia.nix
    ./networking/networking.nix
    ./audio/audio.nix
    ./users/tyler.nix
    ./packages/packages.nix
    ./de/gnome.nix
  ];

  # ============================================================================
  # System Version (How NixOS formats the database. DO NOT CHANGE!)
  # ============================================================================

  system.stateVersion = "26.05";

}
