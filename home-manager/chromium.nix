# ============================================================================
# Chromium 
# ============================================================================
# ADD SCALING

{ ... }:

{
  programs.chromium = {
    enable = true;

    extensions = [
      "ddkjiahejlhfcafbddmgiahcphecmpfh" # uBlock Origin Lite
    ];
  };
}

