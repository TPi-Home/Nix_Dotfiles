# ============================================================================
# Default Applications
# ============================================================================
{ ... }: {
  xdg.mimeApps = {
    enable = true;

    defaultApplications = {
      # Web browser
      "text/html" = [ "firefox.desktop" ];
      "application/xhtml+xml" = [ "firefox.desktop" ];
      "x-scheme-handler/http" = [ "firefox.desktop" ];
      "x-scheme-handler/https" = [ "firefox.desktop" ];

      # PDF documents
      "application/pdf" = [ "org.kde.okular.desktop" ];

      # Text and source files
      "text/plain" = [ "code.desktop" ];
      "text/markdown" = [ "code.desktop" ];
      "application/json" = [ "code.desktop" ];
      "application/x-shellscript" = [ "code.desktop" ];

      # Images
      "image/avif" = [ "firefox.desktop" ];
      "image/bmp" = [ "firefox.desktop" ];
      "image/gif" = [ "firefox.desktop" ];
      "image/jpeg" = [ "firefox.desktop" ];
      "image/png" = [ "firefox.desktop" ];
      "image/svg+xml" = [ "firefox.desktop" ];
      "image/tiff" = [ "firefox.desktop" ];
      "image/webp" = [ "firefox.desktop" ];
      "image/x-icon" = [ "firefox.desktop" ];
    };
  };

  xdg.configFile."xfce4/helpers.rc".text = ''
    TerminalEmulator=ghostty
  '';
}
