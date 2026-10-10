{
  description = "TPi's NixOS configuration";

  nixConfig = {
    extra-substituters = ["https://noctalia.cachix.org"];
    extra-trusted-public-keys = [
      "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
    ];
  };

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

    noctalia.url = "github:noctalia-dev/noctalia/cachix";
  };

  outputs = inputs@{
    self,
    nixpkgs,
    stylix,
    home-manager,
    ...
  }: {
    nixosConfigurations = {
      generic = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };

        # Could point to /etc/nixos on a fresh install
        modules = [
          ./modules/default.nix
          ./hosts/generic/default.nix

          stylix.nixosModules.stylix
          home-manager.nixosModules.home-manager

          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs; };

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
