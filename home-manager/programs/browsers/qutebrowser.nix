# ============================================================================
# Qutebrowser
# ============================================================================
{pkgs, ...}: {
  programs.qutebrowser = {
    enable = true;
    settings = {
      content.blocking.enabled = true;
      content.blocking.method = "both"; # Uses both Host blocking and AdblockPlus-style rules
    };
  };
}
