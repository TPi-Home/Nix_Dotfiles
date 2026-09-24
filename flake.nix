{
  description = "TPi's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, stylix, home-manager, ... }:
    {
      nixosConfigurations = {
        generic = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";

          modules = [
            ./modules/default.nix
            ./hosts/generic/hardware-configuration.nix

            stylix.nixosModules.stylix

            home-manager.nixosModules.home-manager

            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.tyler = import ./home-manager/default.nix;
            }
          ];
        };
      };
    };
}