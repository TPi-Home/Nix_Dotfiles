{
  description = "TPi's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    {
      nixosConfigurations = {
        #desktop = nixpkgs.lib.nixosSystem {
          #system = "x86_64-linux";

          #modules = [
            #./modules/configuration.nix
            #./hosts/hardware-configuration.nix

            #home-manager.nixosModules.home-manager

            #{
              #home-manager.useGlobalPkgs = true;
              #home-manager.useUserPackages = true;
              #home-manager.users.tyler = import ./home-manager/home.nix;
            #}
          #];
        #};

        #laptop = nixpkgs.lib.nixosSystem {
          #system = "x86_64-linux";

          #modules = [
            #./modules/configuration.nix
            #./hosts/hardware-configuration.nix

            #home-manager.nixosModules.home-manager

            #{
              #home-manager.useGlobalPkgs = true;
              #home-manager.useUserPackages = true;
              #home-manager.users.tyler = import ./home-manager/home.nix;
            #}
          #];
        #};

        generic = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";

          modules = [
            ./modules/configuration.nix
            ./hosts/generic/hardware-configuration.nix

            home-manager.nixosModules.home-manager

            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.tyler = import ./home-manager/default.nix;
            }
          ];
        };
      };
    }
}