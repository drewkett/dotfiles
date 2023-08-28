{ lib, ... }:
{
  programs.zsh = {
    enable = true;
    enableFzfHistory = true;
  };
  programs.ssh = {
    enable = true;
    extraConfig = ''
      AddKeysToAgent  yes
    '';
    matchBlocks = {
      kyoto = {
        hostname="kyoto.local";
        user="andrew";
      };
    };
  };
}
