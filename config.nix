{
  packageOverrides = pkgs_: with pkgs_; {
    all = with pkgs; let
      linuxOnlyPackages = with pkgs; [
        rustc
        filezilla
        wireshark
        libreoffice
        meld
      ];
      allPackages =  [
        go
        julia
        R
        openjdk
        leiningen
        racket

        git
        cvs
        emacs
        vim
        neovim
        silver-searcher
        htop

        source-code-pro

        chromium
        mypython

        nix-repl
      ];
    in 
      buildEnv rec {
        name = "all";
        paths =
          if stdenv.isDarwin
          then allPackages
          else allPackages ++ linuxOnlyPackages;
      };
    mypython = python34.buildEnv.override {
      extraLibs = with python34Packages; [
        python34
        numpy
        scipy
        matplotlib
        tables
        pandas
        ipython
      ];
      ignoreCollisions = true;
    };
    # emacs = if pkgs.stdenv.isDarwin
    #         then pkgs.emacs24Macport
    #         else pkgs.emacs24;
    emacs = emacs.override { withGTK3 = true; withGTK2=false; };
  };
  chromium = {
    enablePepperFlash = true;
  };
}
