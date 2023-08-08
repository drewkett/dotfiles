{
  description = "My Home Manager flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixos-23_05.url = "github:nixos/nixpkgs/nixos-23.05";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # hush = {
    #   url = "github:hush-shell/hush";
    #   flake = false;
    # };
    #nixos-generators = {
    #  url = "github:nix-community/nixos-generators";
    #  inputs.nixpkgs.follows = "nixpkgs";
    #};
  };

  outputs = inputs @ { self, nixpkgs, home-manager, ... }:
    let
      importPkgs = (system: import nixpkgs {
        inherit system;
      });

      # Helper to provide system-specific attributes
      forAllSystems = f: nixpkgs.lib.genAttrs allSystems (system: f {
        inherit system;
        pkgs = (importPkgs system);
      });

      homeConfig = ({ home, username ? "andrew", pkgs }:
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          modules = [
            { home.username = username; }
            home
          ];
        });
    in
    {
      inherit allSystems importPkgs forAllSystems home-manager;

      devShells = forAllSystems ({ pkgs, system }: {
        default = self.devShells.${system}.dotfiles;
        dotfiles = pkgs.mkShell {
          # The Nix packages provided in the environment
          packages = (with pkgs; [
            gh
            ripgrep
            bottom
            fd
            neovim
            borgbackup
          ])
        };
      });
    };
}
