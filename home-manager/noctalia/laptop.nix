{
  # Laptop-specific Noctalia configuration for the 2560x1600 eDP panel.
  programs.noctalia.settings = ../../home/.config/noctalia/hosts/laptop.toml;

  home.sessionVariables = {
    QT_SCALE_FACTOR = "1.5";
    QT_DPI_SCALE = "1.5";
  };
}
