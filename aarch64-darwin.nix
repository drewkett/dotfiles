{ lib, ... }:
{
  programs.zsh = {
    enable = true;
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
