# ============================================================================
# Chromium
# ============================================================================
{...}: {
  programs.chromium = {
    enable = true;

    commandLineArgs = [
      "--force-device-scale-factor=1.0"
    ];

    extensions = [
      "ddkjiahejlhfcafbddmgiahcphecmpfh" # uBlock Origin Lite
      "eimadpbcbfnmbkopoojfekhnkhdbieeh" # Dark Reader
      "doojmbjmlfjjnbmnoijecmcbfeoakpjm" # NoScript
    ];
  };
}
