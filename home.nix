{pkgs, fantasy, ...}: {
  home.username = "andrew";
  home.homeDirectory = "/home/andrew";
  home.stateVersion = "23.05"; # To figure this out you can comment out the line and see what version it expected.
  home.packages = [
      pkgs.gh
      pkgs.ripgrep
      pkgs.bottom
      pkgs.fd
      pkgs.neovim
      pkgs.borgbackup
      #pkgs.gcc
      #pkgs.poetry
  ];
  home.sessionVariables = {
      EDITOR = "vim";
  };
  programs.home-manager.enable = true;

  systemd.user.services.bbh = {
    Unit.Description = "bb_hitters";
    Install.WantedBy = [ "default.target" ];
    Service = {
      WorkingDirectory = "/home/andrew/code/fantasy";
      Environment = [
        "STREAMLIT_SERVER_HEADLESS=true"
        "STREAMLIT_SERVER_PORT=8520"
        "STREAMLIT_BROWSER_GATHER_USAGE_STATS=false"
      ];
      ExecStart = "${fantasy.apps.x86_64-linux.streamlit.program} run bin/bb_hitters_2022.py";
    };
  };
  systemd.user.services.bbp = {
    Unit.Description = "bb_pitchers";
    Install.WantedBy = [ "default.target" ];
    Service = {
      WorkingDirectory = "/home/andrew/code/fantasy";
      Environment = [
        "STREAMLIT_SERVER_HEADLESS=true"
        "STREAMLIT_SERVER_PORT=8521"
        "STREAMLIT_BROWSER_GATHER_USAGE_STATS=false"
      ];
      ExecStart = "${fantasy.apps.x86_64-linux.streamlit.program} run bin/bb_pitchers_2022.py";
    };
  };
  systemd.user.services.bbid = {
    Unit.Description = "bb_id_map";
    Install.WantedBy = [ "default.target" ];
    Service = {
      WorkingDirectory = "/home/andrew/code/fantasy";
      Environment = [
        "STREAMLIT_SERVER_HEADLESS=true"
        "STREAMLIT_SERVER_PORT=8522"
        "STREAMLIT_BROWSER_GATHER_USAGE_STATS=false"
      ];
      ExecStart = "${fantasy.apps.x86_64-linux.streamlit.program} run bin/bb_id_map.py";
    };
  };
}
