# ============================================================================
# Firefox
# ============================================================================
{...}: {
  programs.firefox = {
    enable = true;

    policies = {
      # Updates
      AppAutoUpdate = false;

      # Privacy / Firefox Features
      DisableBuiltinPDFViewer = true;
      DisableFirefoxStudies = true;
      DisableFirefoxAccounts = true;
      DisableFirefoxScreenshots = true;
      DisableProfileRefresh = true;
      DisableSetDesktopBackground = true;
      DisableTelemetry = true;
      DisableFormHistory = true;
      DisablePasswordReveal = true;

      ExtensionSettings = let
        moz = short: "https://addons.mozilla.org/firefox/downloads/latest/${short}/latest.xpi";
      in {
        "uBlock0@raymondhill.net" = {
          install_url = moz "ublock-origin";
          installation_mode = "force_installed";
          updates_disabled = true;
        };

        "addon@darkreader.org" = {
          install_url = moz "darkreader";
          installation_mode = "force_installed";
          updates_disabled = true;
        };

        "{73a6fe31-595d-460b-a920-fcc0f8843232}" = {
          install_url = moz "noscript";
          installation_mode = "force_installed";
          updates_disabled = true;
        };
      };
    };

    profiles.default = {
      id = 0;
      # This is only needed on a system with an existing profile
      path = "d4wf0d9o.default";

      settings = {
        "layout.css.devPixelsPerPx" = "1.4";
      };
    };
  };
}
