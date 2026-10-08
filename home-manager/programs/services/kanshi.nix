# ============================================================================
# Kanshi
# ============================================================================
{pkgs, ...}: {
  xdg.configFile."kanshi/config".text = ''
    profile desktop {
      output "LG Electronics LG ULTRAGEAR 110NTRLAS678" mode 3440x1440@160 position 0,0 scale 1.0
    }

    profile laptop {
      output "EDO EF10QBC64.C Unknown" mode 2560x1600@165 position 0,0 scale 1.0
    }
  '';

  home.packages = [
    pkgs.kanshi
  ];
}
