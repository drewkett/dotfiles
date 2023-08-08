{pkgs, ...}: {
    home.username = "andrew";
    home.homeDirectory = "/home/andrew";
    home.stateVersion = "23.05"; # To figure this out you can comment out the line and see what version it expected.
    home.packages = [
        pkgs.gh
        pkgs.ripgrep
        pkgs.bottom
        pkgs.fd
        pkgs.neovim
        pkgs.borgbackup
        #pkgs.gcc
        #pkgs.poetry
    ];
    home.sessionVariables = {
        EDITOR = "vim";
    };
    programs.home-manager.enable = true;
}
