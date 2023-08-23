{pkgs, lib, fantasy, system, ...}: 
let 
  bb_hitters = "${fantasy.apps.${system}.bb_hitters.program}";
  bb_pitchers = "${fantasy.apps.${system}.bb_pitchers.program}";
  bb_id_map = "${fantasy.apps.${system}.bb_id_map.program}";
in
{
  programs.bash = {
    enable = true;
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
