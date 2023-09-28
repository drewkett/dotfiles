{ lib, ... }:
{
  programs.zsh = {
    enable = true;
  };
  programs.ssh = {
    matchBlocks = {
      kyoto = {
        hostname="kyoto.local";
        user="andrew";
      };
    };
  };
}
