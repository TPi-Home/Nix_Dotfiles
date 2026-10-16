# ============================================================================
# Helium
# ============================================================================
{...}: {
  programs.helium = {
    enable = true;

    commandLineArgs = [
      "--force-device-scale-factor=1.4"
    ];

    extensions = [
      "ddkjiahejlhfcafbddmgiahcphecmpfh" # uBlock Origin Lite
      "eimadpbcbfnmbkopoojfekhnkhdbieeh" # Dark Reader
      "doojmbjmlfjjnbmnoijecmcbfeoakpjm" # NoScript
    ];
  };
}
