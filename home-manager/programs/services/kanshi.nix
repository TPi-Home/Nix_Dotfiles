# ============================================================================
# Fuzzel
# ============================================================================
# ============================================================================
# Kanshi
# ============================================================================
{pkgs, ...}: {
  xdg.configFile."kanshi/config".text = ''
    profile desktop {
      output "LG Electronics LG ULTRAGEAR 110NTRLAS678" mode 3440x1440@160 position 0,0 scale 1.0
    }

    profile laptop {
      output "EDO EF10QBC64.C Unknown" mode 2560x1600@165 position 0,0 scale 1.0
    }
  '';

  home.packages = [
    pkgs.kanshi
  ];

#  systemd.user.services.kanshi = {
#    Unit = {
#      Description = "Kanshi output autoconfig";
#      PartOf = ["graphical-session.target"];
#      After = ["graphical-session-pre.target"];
#    };
#
#    Service = {
#      ExecStart = "${pkgs.kanshi}/bin/kanshi";
#      Restart = "always";
#      RestartSec = 1;
#      Environment = [
#        "XDG_CONFIG_HOME=%h/.config"
#      ];
#    };
#
#    Install = {
#      WantedBy = ["graphical-session.target"];
#    };
#  };
}