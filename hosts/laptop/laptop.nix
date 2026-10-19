{pkgs, ...}: {
  programs.vivaldi.commandLineArgs = [
    "--force-device-scale-factor=1.25"
  ];

  programs.firefox.profiles.default.settings."layout.css.devPixelsPerPx" = "1.25";

  xdg.desktopEntries.unityhub.exec =
    "${pkgs.unityhub}/opt/unityhub/unityhub --force-device-scale-factor=1.5 %U";

  home.pointerCursor.size = 30;

  home.sessionVariables = {
    QT_SCALE_FACTOR = "1.25";
    QT_DPI_SCALE = "1.25";
    GDK_DPI_SCALE = "1.25";
  };
}
