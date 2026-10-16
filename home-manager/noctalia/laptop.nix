{
  # Keep the existing enlarged UI for the laptop's high-resolution display.
  programs.noctalia.settings = {
    accessibility.ui_scale = 1.5;
    bar.default.scale = 1.5;
    notification.scale = 1.5;
    osd.scale = 1.5;
    widget.clock.font_scale = 1.5;
  };

  home.sessionVariables = {
    QT_SCALE_FACTOR = "1.5";
    QT_DPI_SCALE = "1.5";
  };
}
