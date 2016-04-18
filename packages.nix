with import (fetchTarball https://nixos.org/channels/nixpkgs-unstable/nixexprs.tar.xz) {};
let 
  # mychromium = chromium.override {
  #   enablePepperFlash = true;
  #   enableNaCl = true;
  # };
  # mychromium = chromium.override {enablePepperFlash = true;};
  mypython = python3.buildEnv.override {
    extraLibs = with pkgs.python3Packages; [ numpy scipy matplotlib tables pandas notebook jupyter_console ];
  };
  #mynode = nodejs.buildEnv.override {
  #  extraLibs = with pkgs.nodePackages; [ jsbeautify ];
  #};
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
  inherit mypython;
  inherit go julia leiningen rustc;
  inherit nodejs npm2nix;
  inherit (nodePkgs) "js-beautify" "tern" "bower" "jshint" ;
  myR = pkgs.rWrapper.override {
    packages = with pkgs.rPackages; [
      ggplot2
      reshape2
      recommenderlab
    ];
  };
}
