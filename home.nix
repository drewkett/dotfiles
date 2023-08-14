{pkgs, lib, fantasy, jj, system, username, homedir, ...}: 
let
  inherit (lib) mkIf;
  inherit (pkgs.stdenv) isLinux isDarwin;
in
{
  home.username = "${username}";
  home.homeDirectory = "${homedir}";
  home.stateVersion = "23.05"; # To figure this out you can comment out the line and see what version it expected.
  home.packages = [
      pkgs.borgbackup
      pkgs.bottom
      pkgs.fd
      pkgs.neovim
      pkgs.ripgrep
      jj.packages.${system}.default
  ];
  home.sessionVariables = {
      EDITOR = "vim";
  };
  programs.home-manager.enable = true;

  programs.firefox = {
    enable = true;
  };
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
  programs.jujutsu = {
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
    extraConfig = ''
      silent! colorscheme molokai
      let mapleader = "\<Space>"
      let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
      set mouse=a

      nnoremap <Leader>re :edit ~\.vimrc<CR>
      nnoremap <Leader>p :CtrlP<CR>
      nnoremap <Leader>gs :Git<CR>
      nnoremap <Leader>gp :Git push<CR>
      nnoremap <Leader>gpo :Git push -u origin HEAD<CR>
      nnoremap <Leader>gP :Git pull<CR>
      nnoremap <Leader>gl :Git log<CR>
      nnoremap <Leader>gb :Git switch 
      nnoremap <Leader>gB :Git checkout -b 
    '';
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

  systemd.user.services.bbh = mkIf isLinux {
    Unit.Description = "bb_hitters";
    Install.WantedBy = [ "default.target" ];
    Service = {
      WorkingDirectory = "/home/andrew/code/fantasy";
      Environment = [
        "STREAMLIT_SERVER_HEADLESS=true"
        "STREAMLIT_SERVER_PORT=8520"
        "STREAMLIT_BROWSER_GATHER_USAGE_STATS=false"
      ];
      ExecStart = "${fantasy.apps.${system}.streamlit.program} run bin/bb_hitters_2022.py";
    };
  };
  systemd.user.services.bbp = mkIf isLinux {
    Unit.Description = "bb_pitchers";
    Install.WantedBy = [ "default.target" ];
    Service = {
      WorkingDirectory = "/home/andrew/code/fantasy";
      Environment = [
        "STREAMLIT_SERVER_HEADLESS=true"
        "STREAMLIT_SERVER_PORT=8521"
        "STREAMLIT_BROWSER_GATHER_USAGE_STATS=false"
      ];
      ExecStart = "${fantasy.apps.${system}.streamlit.program} run bin/bb_pitchers_2022.py";
    };
  };
  systemd.user.services.bbid = mkIf isLinux {
    Unit.Description = "bb_id_map";
    Install.WantedBy = [ "default.target" ];
    Service = {
      WorkingDirectory = "/home/andrew/code/fantasy";
      Environment = [
        "STREAMLIT_SERVER_HEADLESS=true"
        "STREAMLIT_SERVER_PORT=8522"
        "STREAMLIT_BROWSER_GATHER_USAGE_STATS=false"
      ];
      ExecStart = "${fantasy.apps.${system}.streamlit.program} run bin/bb_id_map.py";
    };
  };
}
