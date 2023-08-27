{pkgs, lib, inputs, system, ...}: 
let 
  fantasy = inputs.fantasy;
  bb_hitters = "${fantasy.apps.${system}.bb_hitters.program}";
  bb_pitchers = "${fantasy.apps.${system}.bb_pitchers.program}";
  bb_id_map = "${fantasy.apps.${system}.bb_id_map.program}";
in
{
  programs.ssh = {
    enable = true;
    extraConfig = ''
      AddKeysToAgent  yes
    '';
  };
  programs.bash = {
    enable = true;
    sessionVariables = {
      SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket";
    };
  };
  systemd.user.services.ssh_agent = {
    Unit.Description = "SSH Agent";
    Install.WantedBy = [ "default.target" ];
    Service = {
      WorkingDirectory = "/home/andrew/code/fantasy";
      Environment = [
        "SSH_AUTH_SOCK=%t/ssh-agent.socket"
      ];
      ExecStart = "${pkgs.openssh}/bin/ssh-agent -D -a $SSH_AUTH_SOCK";
    };
  };
  systemd.user.services.bb_hitters = {
    Unit.Description = "bb_hitters";
    Install.WantedBy = [ "default.target" ];
    Service = {
      WorkingDirectory = "/home/andrew/code/fantasy";
      Environment = [
        "STREAMLIT_SERVER_PORT=8520"
      ];
      ExecStart = "${bb_hitters}";
    };
  };
  systemd.user.services.bb_pitchers = {
    Unit.Description = "bb_pitchers";
    Install.WantedBy = [ "default.target" ];
    Service = {
      WorkingDirectory = "/home/andrew/code/fantasy";
      Environment = [
        "STREAMLIT_SERVER_PORT=8521"
      ];
      ExecStart = "${bb_pitchers}";
    };
  };
  systemd.user.services.bb_id_map = {
    Unit.Description = "bb_id_map";
    Install.WantedBy = [ "default.target" ];
    Service = {
      WorkingDirectory = "/home/andrew/code/fantasy";
      Environment = [
        "STREAMLIT_SERVER_PORT=8522"
      ];
      ExecStart = "${bb_id_map}";
    };
  };
}
