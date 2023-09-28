{pkgs, devenv, system, ...}:
{
  home.packages = [
      pkgs.borgbackup
      pkgs.bottom
      pkgs.fd
      pkgs.fira-code
      pkgs.ripgrep
      devenv.packages.${system}.default
  ];
  programs.autojump = {
    enable = true;
  };
  programs.bat = {
    enable = true;
  };
  programs.eza = {
    enable = true;
  };
  programs.gh = {
    enable = true;
  };
  programs.git = {
    enable = true;
    userName = "Andrew Burkett";
    userEmail = "burkett.andrew@gmail.com";
    ignores = [ "*.swp" ];
  };
  programs.jq = {
    enable = true;
  };
  programs.ssh = {
    enable = true;
    extraConfig = ''
      AddKeysToAgent  yes
    '';
  };
  programs.starship = {
    enable = true;
  };
  programs.tmux = {
    enable = true;
    mouse = true;
    keyMode = "vi";
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
