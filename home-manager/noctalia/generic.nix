{pkgs, ...}: {
  # Portable fallback without assumptions about a particular output name.
  programs.noctalia.settings = ../../home/.config/noctalia/hosts/generic.toml;

  programs.vivaldi.commandLineArgs = [
    "--force-device-scale-factor=1.5"
  ];

  programs.firefox.profiles.default.settings."layout.css.devPixelsPerPx" = "1.5";

  xdg.desktopEntries.unityhub.exec =
    "${pkgs.unityhub}/opt/unityhub/unityhub --force-device-scale-factor=1.5 %U";

  home.pointerCursor.size = 36;

  home.sessionVariables = {
    QT_SCALE_FACTOR = "1.5";
    QT_DPI_SCALE = "1.5";
    GDK_DPI_SCALE = "1.5";
  };
}
