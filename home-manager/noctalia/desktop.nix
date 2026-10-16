{
  # Desktop-specific Noctalia configuration for the 3440x1440 ultrawide.
  programs.noctalia.settings = ../../home/.config/noctalia/hosts/desktop.toml;

  home.sessionVariables = {
    QT_SCALE_FACTOR = "1.0";
    QT_DPI_SCALE = "1.0";
  };
}
