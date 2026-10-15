# ============================================================================
# Default Applications
# ============================================================================
{pkgs, ...}: {
  xdg.mimeApps = {
    enable = true;

    defaultApplications = {
      # Web browser
      "text/html" = ["firefox.desktop"];
      "application/xhtml+xml" = ["firefox.desktop"];
      "x-scheme-handler/http" = ["firefox.desktop"];
      "x-scheme-handler/https" = ["firefox.desktop"];

      # PDF documents
      "application/pdf" = ["org.gnome.Evince.desktop"];

      # Text and source files
      "text/plain" = ["code.desktop"];
      "text/markdown" = ["code.desktop"];
      "application/json" = ["code.desktop"];
      "application/x-shellscript" = ["code.desktop"];

      # Images (need desktop app)
      "image/png" = ["imv.desktop"];
      "image/jpeg" = ["imv.desktop"];
      "image/webp" = ["imv.desktop"];
    };
  };

  xdg.configFile."xfce4/helpers.rc".text = ''
    TerminalEmulator=ghostty
  '';
}
