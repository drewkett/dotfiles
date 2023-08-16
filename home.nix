{pkgs, lib, fantasy, system, username, homedir, ...}: 
let
  inherit (lib) mkIf;
  inherit (pkgs.stdenv) isLinux isDarwin;
in
{
  imports = [
    ./systemd.nix
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

  programs.gh = {
    enable = true;
  };
  programs.tmux = {
    enable = true;
  };
  programs.jq = {
    enable = true;
  };
  programs.bat = {
    enable = true;
  };
  programs.git = {
    enable = true;
    userName = "Andrew Burkett";
    userEmail = "burkett.andrew@gmail.com";
    ignores = [ "*.swp" ];
  };
  programs.vim = {
    enable = true;
    extraConfig = (builtins.readFile ./vimrc);
    plugins = with pkgs.vimPlugins; [
      ctrlp
      rust-vim
      vim-airline
      vim-fugitive
      vim-colorschemes
      vim-gitgutter
      vim-prettier
    ];
  };
}
