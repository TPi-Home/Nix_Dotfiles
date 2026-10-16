{
  # Portable fallback without assumptions about a particular output name.
  programs.noctalia.settings = ../../home/.config/noctalia/hosts/generic.toml;

  home.sessionVariables = {
    QT_SCALE_FACTOR = "1.5";
    QT_DPI_SCALE = "1.5";
  };
}
