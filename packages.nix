with import (fetchTarball https://nixos.org/channels/nixpkgs-unstable/nixexprs.tar.xz) {};
let 
  chromium.enablePepperFlash = true;
  emacs = {withGTK3= true; wthGTK2 = false; };
  mypython = python3.buildEnv.override {
    extraLibs = with pkgs.python3Packages; [ numpy scipy matplotlib tables pandas notebook jupyter_console ];
  };
in {
  inherit
    git cvs

    vim neovim emacs

    silver-searcher htop ethtool fasd p7zip
    nix-repl

    go julia R leiningen rustc mypython
    nodejs

    aspell aspellDicts
    source-code-pro

    irssi
    filezilla
    wireshark
    chromium
    ;
}
