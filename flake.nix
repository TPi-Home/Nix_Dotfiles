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

    nix-wrapper-modules = {
      url = "github:nix-community/nix-wrapper-modules";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    stylix,
    home-manager,
    nix-wrapper-modules,
    ...
  }: {
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

            home-manager.extraSpecialArgs = {
              inherit nix-wrapper-modules;
            };

            home-manager.users.tyler = {
              imports = [
                stylix.homeModules.stylix
                ./home-manager/default.nix
              ];
            };
          }
        ];
      };
    };
  };
}
