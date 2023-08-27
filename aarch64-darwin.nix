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
  };
}
