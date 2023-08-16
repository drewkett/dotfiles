{pkgs, lib, fantasy, system, ...}: 
{
  systemd.user.services.bbh = lib.mkIf pkgs.stdenv.isLinux {
    Unit.Description = "bb_hitters";
    Install.WantedBy = [ "default.target" ];
    Service = {
      #WorkingDirectory = "/home/andrew/code/fantasy";
      Environment = [
        "STREAMLIT_SERVER_HEADLESS=true"
        "STREAMLIT_SERVER_PORT=8520"
        "STREAMLIT_BROWSER_GATHER_USAGE_STATS=false"
      ];
      ExecStart = "${fantasy.apps.${system}.streamlit.program} run bin/bb_hitters_2022.py";
    };
  };
  systemd.user.services.bbp = lib.mkIf pkgs.stdenv.isLinux {
    Unit.Description = "bb_pitchers";
    Install.WantedBy = [ "default.target" ];
    Service = {
      #WorkingDirectory = "/home/andrew/code/fantasy";
      Environment = [
        "STREAMLIT_SERVER_HEADLESS=true"
        "STREAMLIT_SERVER_PORT=8521"
        "STREAMLIT_BROWSER_GATHER_USAGE_STATS=false"
      ];
      ExecStart = "${fantasy.apps.${system}.streamlit.program} run bin/bb_pitchers_2022.py";
    };
  };
  systemd.user.services.bbid = lib.mkIf pkgs.stdenv.isLinux {
    Unit.Description = "bb_id_map";
    Install.WantedBy = [ "default.target" ];
    Service = {
      #WorkingDirectory = "/home/andrew/code/fantasy";
      Environment = [
        "STREAMLIT_SERVER_HEADLESS=true"
        "STREAMLIT_SERVER_PORT=8522"
        "STREAMLIT_BROWSER_GATHER_USAGE_STATS=false"
      ];
      ExecStart = "${fantasy.apps.${system}.streamlit.program} run bin/bb_id_map.py";
    };
  };
}
