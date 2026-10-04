# ============================================================================
# Mango
# ============================================================================
{pkgs, ...}: {
  wayland.windowManager.mango = {
    enable = true;
    systemd.enable = true;
    settings = builtins.readFile ../../home/.config/mango/config.conf;
    autostart_sh = "";
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