{...}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/graphics/nvidia.nix
  ];

  networking.hostName = "laptop";
}
