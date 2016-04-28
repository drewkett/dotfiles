with import <nixpkgs> {};
let 
  nodePkgs = pkgs.nodePackages.override { 
    generated = ./node-packages.nix;
    self = nodePkgs;
  };
  w3lib = buildPythonPackage rec {
   name = "w3lib-${version}";
   version = "1.14.2";

   buildInputs = with pkgs.pythonPackages ; [ six ];

   src = pkgs.fetchurl {
     url = "https://pypi.python.org/packages/source/w/w3lib/${name}.tar.gz";
     sha256 = "bd87eae62d208eef70869951abf05e96a8ee559714074a485168de4c5b190004";
   };
  };
  queuelib = buildPythonPackage rec {
   name = "queuelib-${version}";
   version = "1.4.2";

   src = pkgs.fetchurl {
     url = "https://pypi.python.org/packages/source/q/queuelib/${name}.tar.gz";
     sha256 = "a6829918157ed433fafa87b0bb1e93e3e63c885270166db5884a02c34c86f914";
   };
  };
  scrapy = buildPythonPackage rec {
   name = "Scrapy-${version}";
   version = "1.0.5";

   propagatedBuildInputs = with pkgs.python2Packages ; [ six twisted w3lib lxml cssselect queuelib pyopenssl service-identity ];

   src = pkgs.fetchurl {
     url = "https://pypi.python.org/packages/source/S/Scrapy/${name}.tar.gz";
     sha256 = "0a51c785a310d65f6e70285a2da56d48ef7d049bd7fd60a08eef05c52328ca96";
   };
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
  inherit tesseract ghostscript imagemagick;
  inherit poppler_utils;
  inherit (nodePkgs) "js-beautify" "tern" "bower" "jshint" ;

  okular = pkgs.kde5.okular;
  mypython = python3.buildEnv.override {
    extraLibs = with pkgs.python3Packages; [
          numpy scipy matplotlib tables pandas notebook jupyter_console redis
    ];
  };
  inherit scrapy;
  myR = pkgs.rWrapper.override {
    packages = with pkgs.rPackages; [
      ggplot2
      reshape2
      recommenderlab
    ];
  };
}
