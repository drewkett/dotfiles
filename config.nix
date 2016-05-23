{
  allowUnfree = true;
  packageOverrides = pkgs: rec {
    me = pkgs.buildEnv {
      name = "me";
      paths = [
        pkgs.git pkgs.cvs
        pkgs.vim pkgs.neovim pkgs.emacs
        pkgs.gfortran pkgs.gnumake pkgs.gdb
        pkgs.irssi
        pkgs.fasd
        pkgs.nix-repl
        pkgs.go pkgs.julia pkgs.leiningen pkgs.rustc pkgs.ruby
        pkgs.nodejs pkgs.npm2nix
        pkgs.redis
        pkgs.subversion
        pkgs.tesseract pkgs.ghostscript pkgs.imagemagick
        pkgs.poppler_utils
        (pkgs.rWrapper.override {
          packages = with pkgs.rPackages; [
            ggplot2
            reshape2
            recommenderlab
          ];
        })
        (pkgs.python35.buildEnv.override {
          extraLibs = with pkgs.python35Packages; [
            numpy scipy matplotlib tables pandas notebook jupyter_console redis dask scikitlearn Theano aiohttp flask
          ];
        })
        pkgs.python2Packages.scrapy
      ];
    };
  };
}
