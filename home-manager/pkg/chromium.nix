# ============================================================================
# Chromium
# ============================================================================

{ ... }:

{
  programs.chromium = {
    enable = true;

    commandLineArgs = [
      "--force-device-scale-factor=1.25"
    ];

    extensions = [
      "ddkjiahejlhfcafbddmgiahcphecmpfh" # uBlock Origin Lite
    ];
  };
}