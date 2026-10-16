# ============================================================================
# Default Applications
# ============================================================================
{...}: {
  xdg.mimeApps = {
    enable = true;

    defaultApplications = {
      # Web browser
      "text/html" = ["firefox.desktop"];
      "application/xhtml+xml" = ["firefox.desktop"];
      "x-scheme-handler/http" = ["firefox.desktop"];
      "x-scheme-handler/https" = ["firefox.desktop"];

      # PDF documents
      "application/pdf" = ["org.kde.okular.desktop"];

      # Text and source files
      "text/plain" = ["code.desktop"];
      "text/markdown" = ["code.desktop"];
      "application/json" = ["code.desktop"];
      "application/x-shellscript" = ["code.desktop"];

      # Images
      "image/png" = ["firefox.desktop"];
      "image/jpeg" = ["firefox.desktop"];
      "image/webp" = ["firefox.desktop"];
    };
  };

  xdg.configFile."xfce4/helpers.rc".text = ''
    TerminalEmulator=ghostty
  '';
}
