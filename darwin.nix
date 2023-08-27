{ nixpkgs, ... } :
let 
  username = "andrewburkett";
  homedir = "/Users/andrewburkett";
  system = "aarch64-darwin";
in
{
  programs.zsh.enable = true;
  services.nix-daemon.enable = true;
  users.users."${username}" = {
    name = "${username}";
    home = "${homedir}";
  };
  home-manager.users."${username}" = import ./home.nix {
    pkgs = import nixpkgs { inherit system; };
    system = "${system}";
    username = "${username}";
    homedir = "${homedir}";
  };
}
