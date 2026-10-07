# ============================================================================
# Ghostty
# ============================================================================
{pkgs, ...}: {
  programs.ghostty = {
    enable = true;
    enableFishIntegration = true;

    # Ghostty and ncurses both provide this terminfo entry. Keep the ncurses
    # copy so Home Manager's buildEnv does not see two files at the same path.
    package = pkgs.ghostty.overrideAttrs (old: {
      postInstall = (old.postInstall or "") + ''
        rm -f $out/share/terminfo/g/ghostty
      '';
    });

    settings = {
      # Theme
      background = "#111317";
      foreground = "#ADB0BB";
      cursor-color = "#5EB7FF";

      selection-background = "#26343F";
      selection-foreground = "#ADB0BB";

      palette = [
        "0=#111317"
        "1=#F8747E"
        "2=#75AD47"
        "3=#D09214"
        "4=#50A4E9"
        "5=#CC83E3"
        "6=#00B298"
        "7=#9B9FA9"
        "8=#3A3E47"
        "9=#FF838B"
        "10=#87C05F"
        "11=#DFAB25"
        "12=#5EB7FF"
        "13=#DD97F1"
        "14=#4AC2B8"
        "15=#E0E0Ee"
      ];

      # Window
      background-opacity = .9;
      window-save-state = "never";
      window-width = 1280;
      window-height = 800;

      # Font
      font-family = "Monaspace Neon NF";
      font-family-bold = "Monaspace Neon NF Bold";
      font-family-italic = "Monaspace Neon NF Italic";
      font-family-bold-italic = "Monaspace Neon NF Italic";
      font-size = 16;

      # Shell
      command = "fish";
      shell-integration = "fish";
    };
  };
}
