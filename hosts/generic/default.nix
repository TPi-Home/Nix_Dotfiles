{ ... }: {
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "nixos";
}
