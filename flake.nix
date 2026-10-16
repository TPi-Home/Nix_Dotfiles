{
  description = "TPi's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    noctalia.url = "github:noctalia-dev/noctalia/cachix";

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
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

        # Could point to /etc/nixos on a fresh install
        modules = [
          ./modules/default.nix
          ./hosts/generic/default.nix

          stylix.nixosModules.stylix
          home-manager.nixosModules.home-manager

          {
            home-manager.extraSpecialArgs = { inherit inputs; };
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

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
