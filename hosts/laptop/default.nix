{...}: {
  imports = [
    ./hardware-configuration.nix
    ./laptop.nix
    ../../modules/graphics/nvidia.nix
  ];

  networking.hostName = "laptop";
}
