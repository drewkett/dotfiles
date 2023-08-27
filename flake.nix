{
  description = "My Home Manager flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    fantasy.url = "github:drewkett/fantasy";
  };

  outputs = inputs @ { nixpkgs, home-manager, darwin, fantasy, ... }: {
    defaultPackage.x86_64-linux = home-manager.defaultPackage.x86_64-linux;
    defaultPackage.aarch64-darwin = home-manager.defaultPackage.aarch64-darwin;
    homeConfigurations = {
      fedora = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs { system = "x86_64-linux"; };
        modules  = [ ./home.nix ];
        extraSpecialArgs = {
          inherit inputs;
          system = "x86_64-linux";
          username = "andrew";
          homedir = "/home/andrew";
        };
      };
      mac = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs { system = "aarch64-darwin"; };
        modules  = [ ./home.nix ];
        extraSpecialArgs = {
          inherit inputs;
          system = "aarch64-darwin";
          username = "andrewburkett";
          homedir = "/Users/andrewburkett";
        };
      };
    };
  };
}
