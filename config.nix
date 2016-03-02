{
  packageOverrides = pkgs_: with pkgs_; {
    all = with pkgs; let
      linuxOnlyPackages = with pkgs; [
        rustc
        ( emacs.override { withGTK3 = true; withGTK2=false; } )
        filezilla
        wireshark
        libreoffice
        meld
      ];
      macOnlyPackages = with pkgs; [
        emacsMacPort
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
        vim
        neovim
        silver-searcher
        htop

        source-code-pro

        ( chromium.override { enablePepperFlash = true; } )

        nix-repl
        ( python34.buildEnv.override {
              extraLibs = with python34Packages; [numpy scipy matplotlib tables pandas ipython];
              ignoreCollisions = true;
        } )
      ];
    in
      buildEnv rec {
        name = "all";
        paths =
          if stdenv.isDarwin
          then allPackages ++ macOnlyPackages
          else allPackages ++ linuxOnlyPackages;
      };
  };
}
