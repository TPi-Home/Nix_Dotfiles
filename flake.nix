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

    mangowm = {
      url = "github:mangowm/mango";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    mangobar = {
      url = "github:mangowm/mangobar";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    stylix,
    home-manager,
    mangowm,
    mangobar,
    ...
  }: {
    nixosConfigurations = {
      generic = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        # Could point to /etc/nixos on a fresh install
        modules = [
          ./modules/default.nix
          ./hosts/generic/default.nix

          stylix.nixosModules.stylix
          mangowm.nixosModules.mango
          home-manager.nixosModules.home-manager

          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.users.tyler = {
              imports = [
                stylix.homeModules.stylix
                mangobar.homeManagerModules.default
                ./home-manager/default.nix
              ];
            };
          }
        ];
      };
    };
  };
}
