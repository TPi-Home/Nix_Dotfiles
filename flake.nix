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

  outputs =
    inputs@{
      nixpkgs,
      stylix,
      home-manager,
      ...
    }:
    let
      mkHost =
        host:
        nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";

          modules = [
            ./modules/default.nix
            (./hosts + "/${host}/default.nix")

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
                  (./home-manager/noctalia + "/${host}.nix")
                  (./home-manager/kanshi + "/${host}.nix")
                  (./home-manager/de/sway + "/${host}.nix")
                  (./home-manager/hosts + "/${host}.nix")
                ];
              };
            }
          ];
        };
    in
    {
      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-tree;

      nixosConfigurations = {
        generic = mkHost "generic";
        desktop = mkHost "desktop";
        laptop = mkHost "laptop";
      };
    };
}
