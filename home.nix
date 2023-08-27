{pkgs, username, system, homedir, ...}: 
{
  imports = [
    ./programs.nix
    ./${system}.nix
  ];

  home.username = "${username}";
  home.homeDirectory = "${homedir}";
  # To figure this out you can comment out the line and see what version it
  # expected.
  home.stateVersion = "23.05"; 
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
