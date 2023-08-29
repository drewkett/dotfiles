{ lib, ... }:
{
  programs.zsh = {
    enable = true;
    enableFzfHistory = true;
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
