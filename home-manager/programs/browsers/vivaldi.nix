# ============================================================================
# Vivaldi
# ============================================================================
{...}: {
  programs.vivaldi = {
    enable = true;

    extensions = [
      "ddkjiahejlhfcafbddmgiahcphecmpfh" # uBlock Origin Lite
      "eimadpbcbfnmbkopoojfekhnkhdbieeh" # Dark Reader
      "doojmbjmlfjjnbmnoijecmcbfeoakpjm" # NoScript
    ];
  };
}
