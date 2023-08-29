{
  description = "My Home Manager flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    fantasy.url = "github:drewkett/fantasy";
  };

  outputs = inputs @ { nixpkgs, home-manager, darwin, ... }: {
    darwinConfigurations = {
      mac = darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [
          home-manager.darwinModules.home-manager
          ./darwin.nix
        ];
        specialArgs = {
          inherit nixpkgs inputs;
        };
      };
    };
    nixosConfigurations = {
      linux = let
        system = "x86_64-linux";
        pkgs = import nixpkgs { inherit system; };
      in nixpkgs.lib.nixosSystem {
        modules = [
          ./nixos.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.andrew = import ./home.nix {
              inherit system pkgs;
              username = "andrew";
              homedir = "/home/andrew";
            };
            home-manager.extraSpecialArgs = inputs // { inherit system; };
          }
        ];
      };
    };
    homeConfigurations = {
      fedora = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs { system = "x86_64-linux"; };
        modules  = [ ./home.nix ];
        extraSpecialArgs = inputs // {
          system = "x86_64-linux";
          username = "andrew";
          homedir = "/home/andrew";
        };
      };
      mac = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs { system = "aarch64-darwin"; };
        modules  = [ ./home.nix ];
        extraSpecialArgs = inputs // {
          system = "aarch64-darwin";
          username = "andrewburkett";
          homedir = "/Users/andrewburkett";
        };
      };
    };
  };
}
