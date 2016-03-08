with import (fetchTarball https://nixos.org/channels/nixpkgs-unstable/nixexprs.tar.xz) {};
let 
  chromium.enablePepperFlash = true;
  emacs = {withGTK3= true; wthGTK2 = false; };
  mypython = python34.buildEnv.override {
    extraLibs = with pkgs.python34Packages; [ numpy scipy matplotlib tables pandas ipython ];
  };
in {
  inherit
    git cvs

    vim neovim emacs

    silver-searcher htop ethtool fasd p7zip
    nix-repl

    go julia R leiningen rustc mypython

    aspell
    source-code-pro

    irssi
    filezilla
    wireshark
    chromium
    ;
}
