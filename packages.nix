with import <nixpkgs> {};
let 
  nodePkgs = pkgs.nodePackages.override { 
    generated = ./node-packages.nix;
    self = nodePkgs;
  };
in {
  inherit git cvs;
  inherit terminator;
  inherit vim neovim emacs;
  inherit gfortran gnumake gdb;
  inherit aspell aspellDicts;
  inherit source-code-pro;
  inherit irssi filezilla wireshark libreoffice ;
  inherit htop ethtool fasd silver-searcher which p7zip unzip xclip;
  inherit nix-repl;
  inherit go julia leiningen rustc;
  inherit nodejs npm2nix;
  inherit redis;
  inherit subversion;
  inherit (nodePkgs) "js-beautify" "tern" "bower" "jshint" ;

  okular = pkgs.kde5.okular;
  mypython = python3.buildEnv.override {
    extraLibs = with pkgs.python3Packages; [
          numpy scipy matplotlib tables pandas notebook jupyter_console redis
    ];
  };
  myR = pkgs.rWrapper.override {
    packages = with pkgs.rPackages; [
      ggplot2
      reshape2
      recommenderlab
    ];
  };
}
