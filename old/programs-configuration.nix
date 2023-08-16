{  pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    wget curl htop iotop ethtool file p7zip unzip which silver-searcher xclip
    emacs
    bind
    vim
    terminator
    kde5.okular
    fasd
    transmission wireshark libreoffice filezilla
    aspell aspellDicts.en
    (chromium.override { enablePepperFlash = true; })
    git cvs subversion
    gfortran gnumake
    fasd
    go julia leiningen rustc cargo ruby nodejs
    tesseract ghostscript imagemagick poppler_utils
    (pkgs.python3.buildEnv.override {
      extraLibs = with pkgs.python3Packages; [
        numpy scipy matplotlib tables pandas notebook jupyter_console
      ];
    })
  ];

  fonts = {
    enableFontDir = true;
    enableGhostscriptFonts = true;
    fonts = with pkgs; [
      corefonts
      ubuntu_font_family
      terminus_font
      google-fonts
      unifont
      source-code-pro
    ];
  };
}
