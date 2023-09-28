{ nixpkgs, inputs, ... } :
let 
  # no idea if there's a better way to do this
  username = "andrewburkett";
  homedir = "/Users/andrewburkett";
  system = "aarch64-darwin";
  # I'm not sure why pkgs needs to be done this way here but is available
  # directly on import when using home-manager only.
  pkgs = import nixpkgs { inherit system; };
in
{
  # This is needed so that the global system path ends up added in the global
  # zshrc. Without this darwin-rebuild won't be found.
  programs.zsh.enable = true;
  services.nix-daemon.enable = true;
  # This is needed for home manager to work with nix-darwin it seems.
  users.users."${username}" = {
    name = "${username}";
    home = "${homedir}";
  };
  home-manager.users."${username}" = import ./home.nix {
    inherit pkgs system username homedir;
  };
  home-manager.extraSpecialArgs = inputs // { inherit system; };
  fonts = {
    fontDir.enable = true;
    fonts = [ pkgs.fira-code ];
  };
  homebrew.enable = true;
  homebrew.casks = [
    "iterm2"
    "spectacle"
  ];
  programs.tmux.iTerm2 = true;
}
