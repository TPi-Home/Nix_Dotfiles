# ============================================================================
# Nix System Core
# ============================================================================
{...}: {
  # --------------------------------------------------------------------------
  # Hardware Management
  # --------------------------------------------------------------------------

  # Input Hardware Support
  services.libinput.enable = true;

  # --------------------------------------------------------------------------
  # Software Management
  # --------------------------------------------------------------------------

  nixpkgs.config.allowUnfree = true;
  # services.flatpak.enable = true;

  programs.ghostty = {
    enable = true;
    
    settings = {
      # Font Configuration
      font-family = "Monaspace Neon Nerd Font"; # Adjust style variant if using Argon, Xenon, Radon, Krypton
      font-size = 12;

      # Core Colors
      background = "#1A1D23";
      foreground = "#ADB0BB";
      cursor-color = "#5EB7FF";

      # Selection Colors
      selection-background = "#26343F";
      selection-foreground = "#ADB0BB";

      # Color Palette (0-15)
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
        "15=#ADB0BB"
      ];
    };
  };

  # --------------------------------------------------------------------------
  # Experimental Features Excluding Stylix and Home-Manager
  # --------------------------------------------------------------------------

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # --------------------------------------------------------------------------
  # User Management (No user process can persist)
  # --------------------------------------------------------------------------

  services.logind.settings.Login = {
    KillUserProcesses = true;
  };

  # --------------------------------------------------------------------------
  # Storage/File System
  # --------------------------------------------------------------------------

  services.gvfs.enable = true; # Core virtual file system (needed for trash & USB mounts)
  services.tumbler.enable = true; # Generates image thumbnails in Thunar
  services.udisks2.enable = true; # Auto-mounts external storage
}
