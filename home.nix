{pkgs, lib, fantasy, system, username, homedir, ...}: 
let
  inherit (lib) mkIf;
  inherit (pkgs.stdenv) isLinux isDarwin;
in
{
  imports = [
    ./systemd.nix
    ./programs.nix
  ];

  home.username = "${username}";
  home.homeDirectory = "${homedir}";
  home.stateVersion = "23.05"; # To figure this out you can comment out the line and see what version it expected.
  home.packages = [
      pkgs.borgbackup
      pkgs.bottom
      pkgs.fd
      pkgs.ripgrep
  ];
  home.sessionVariables = {
      EDITOR = "vim";
  };
  programs.home-manager.enable = true;
}
