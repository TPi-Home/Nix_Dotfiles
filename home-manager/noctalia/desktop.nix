{pkgs, ...}: {
  # Desktop-specific configuration for the 3440x1440 ultrawide.
  programs.noctalia.settings = ../../home/.config/noctalia/hosts/desktop.toml;

  programs.vivaldi.commandLineArgs = [
    "--force-device-scale-factor=1.0"
  ];

  programs.firefox.profiles.default.settings."layout.css.devPixelsPerPx" = "1.0";

  xdg.desktopEntries.unityhub.exec =
    "${pkgs.unityhub}/opt/unityhub/unityhub --force-device-scale-factor=1.0 %U";

  home.pointerCursor.size = 24;

  home.sessionVariables = {
    QT_SCALE_FACTOR = "1.0";
    QT_DPI_SCALE = "1.0";
    GDK_DPI_SCALE = "1.0";
  };
}
