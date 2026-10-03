# ============================================================================
# Fuzzel
# ============================================================================
{pkgs, ...}: {
  services.kanshi = {
    enable = true;

    settings = [
      {
        profile = {
          name = "desktop";
          outputs = [
            {
              criteria = "LG Electronics LG ULTRAGEAR 110NTRLAS678";
              mode = "3440x1440@160Hz";
              position = "0,0";
              scale = 1.0;
            }
          ];
        };
      }

      {
        profile = {
          name = "laptop";
          outputs = [
            {
              criteria = "EDO EF10QBC64.C Unknown";
              mode = "2560x1600@165Hz";
              position = "0,0";
              scale = 1.0;
            }
          ];
        };
      }
    ];
  };

  systemd.user.services.kanshi = {
    description = "Kanshi output autoconfig";

    wantedBy = ["graphical-session.target"];
    partOf = ["graphical-session.target"];

    environment = {
      XDG_CONFIG_HOME = "/home/tyler/.config";
    };

    serviceConfig = {
      ExecStart = "${pkgs.kanshi}/bin/kanshi";
      Restart = "always";
      RestartSec = 5;
    };
  };
}
