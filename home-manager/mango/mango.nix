# ============================================================================
# Mango
# ============================================================================
{config, mangobar, pkgs, ...}: {
  wayland.windowManager.mango = {
    enable = true;
    systemd.enable = true;
    systemd.variables = [ "--all" ];
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
    package = mangobar.packages.${pkgs.system}.default.overrideAttrs (old: {
      nativeBuildInputs = old.nativeBuildInputs ++ [ pkgs.makeWrapper ];
      buildInputs = old.buildInputs ++ [ pkgs.librsvg ];
      postFixup = (old.postFixup or "") + ''
        wrapProgram "$out/bin/mangobar" \
          --set GDK_PIXBUF_MODULE_FILE "${pkgs.librsvg}/lib/gdk-pixbuf-2.0/2.10.0/loaders.cache" \
          --prefix XDG_DATA_DIRS : "${config.home.profileDirectory}/share"
      '';
    });
    configFile = ../../home/.config/mangobar/config.jsonc;
  };

  xdg.configFile."mangobar/style.css".source =
    ../../home/.config/mangobar/style.css;
}