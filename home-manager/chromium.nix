# ============================================================================
# Chromium
# ============================================================================

{ ... }:

{
  programs.chromium = {
    enable = true;

    commandLineArgs = [
      "--force-device-scale-factor=1.5"
    ];

    extensions = [
      "ddkjiahejlhfcafbddmgiahcphecmpfh" # uBlock Origin Lite
    ];
  };
}