# ============================================================================
# Mango
# ============================================================================
{pkgs, ...}: {
  wayland.windowManager.mango = {
    enable = true;
    systemd.enable = true;
    settings = builtins.readFile ../../home/.config/mango/config.conf;
    autostart_sh = "systemctl --user reset-failed\nsystemctl --user start mango-session.target";
  };

  # Mango's session target is the compositor session entry point, but the
  # upstream target only BindsTo graphical-session.target. Explicitly pull
  # graphical-session.target in so services WantedBy that target, such as
  # nm-applet, are started in a Mango session too.
  systemd.user.targets.mango-session = {
    Unit = {
      Wants = [ "graphical-session.target" ];
      After = [ "graphical-session.target" ];
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