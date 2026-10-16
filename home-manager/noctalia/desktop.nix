{
  # The desktop's 3440x1440 display does not need the laptop's enlarged UI.
  programs.noctalia.settings = {
    accessibility.ui_scale = 1.0;
    bar.default.scale = 1.0;
    notification.scale = 1.0;
    osd.scale = 1.0;
    widget.clock.font_scale = 1.0;
  };

  home.sessionVariables = {
    QT_SCALE_FACTOR = "1.0";
    QT_DPI_SCALE = "1.0";
  };
}
