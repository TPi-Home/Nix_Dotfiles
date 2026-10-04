# ============================================================================
# Mango
# ============================================================================
{pkgs, ...}: {
  xdg.configFile."mango/config.conf".source =
    ../../home/.config/mango/config.conf;

  systemd.user.targets.mango-session = {
    Unit = {
      Description = "Mango compositor session";
      BindsTo = ["graphical-session.target"];
      Wants = ["graphical-session-pre.target"];
      After = ["graphical-session-pre.target"];
    };
  };

  systemd.user.services.mango-wallpaper = {
    Unit = {
      Description = "Mango wallpaper";
      PartOf = ["mango-session.target"];
    };

    Service = {
      ExecStart = "${pkgs.swaybg}/bin/swaybg -m fill -i /home/tyler/Pictures/Hilltopper.png";
      Restart = "on-failure";
      RestartSec = 1;
    };

    Install = {
      WantedBy = ["mango-session.target"];
    };
  };

  services.mangobar = {
    enable = true;
    systemdTarget = "mango-session.target";
    configFile = ../../home/.config/mangobar/config.jsonc;
  };

  xdg.configFile."mangobar/style.css".source =
    ../../home/.config/mangobar/style.css;
}