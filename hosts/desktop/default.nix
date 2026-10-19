{...}: {
  imports = [
    ./hardware-configuration.nix
    ./desktop.nix
    ../../modules/graphics/nvidia.nix
  ];

  networking.hostName = "desktop";
}
