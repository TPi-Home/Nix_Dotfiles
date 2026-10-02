# ============================================================================
# Librewolf
# ============================================================================
{...}: {
  programs.librewolf = {
    enable = true;

    policies = {
      ExtensionSettings = let
        moz = short: "https://addons.mozilla.org/firefox/downloads/latest/${short}/latest.xpi";
      in {
        "uBlock0@raymondhill.net" = {
          install_url = moz "ublock-origin";
          installation_mode = "force_installed";
          updates_disabled = false;
        };

        "addon@darkreader.org" = {
          install_url = moz "darkreader";
          installation_mode = "force_installed";
          updates_disabled = true;
        };

        "{73a6fe31-595d-460b-a920-fcc0f8843232}" = {
          install_url = moz "noscript";
          installation_mode = "force_installed";
          updates_disabled = false;
        };
      };
    };

    profiles.default = {
      settings = {
        "layout.css.devPixelsPerPx" = "1.3";
      };
    };
  };
}
