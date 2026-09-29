{ pkgs, ... }:

{
  programs.ghostty = {
    enable = true;
    
    settings = {
      # 1. Disable the auto-palette generation to stop color distortion
      palette-generate = false;

      # 2. Set opacity natively 
      background-opacity = 0.85;

      # Font Configuration
      font-family = "Monaspace Neon Nerd Font";
      font-size = 12;

      # Core Colors (Your exact Kitty hex strings)
      background = "#1A1D23";
      foreground = "#ADB0BB";
      cursor-color = "#5EB7FF";

      # Selection Colors
      selection-background = "#26343F";
      selection-foreground = "#ADB0BB";

      # Color Palette (0-15)
      palette = [
        "0=#111317" "1=#F8747E" "2=#75AD47" "3=#D09214"
        "4=#50A4E9" "5=#CC83E3" "6=#00B298" "7=#9B9FA9"
        "8=#3A3E47" "9=#FF838B" "10=#87C05F" "11=#DFAB25"
        "12=#5EB7FF" "13=#DD97F1" "14=#4AC2B8" "15=#ADB0BB"
      ];
    };
  };
}
