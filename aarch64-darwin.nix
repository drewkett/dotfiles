{ ... }:
{
  programs.zsh = {
    enable = true;
  };
  programs.ssh = {
    enable = true;
    extraConfig = ''
      AddKeysToAgent  yes
    '';
    matchBlocks = [
      {
        host="kyoto";
        hostname="kyoto.local";
        user="andrew"
    ];
  };
}
