# ============================================================================
# Nix System Core
# ============================================================================
{ ... }: {
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

  # Allow nix build system to utilize multi-core CPU when building from scratch:
  nix.settings = {
    max-jobs = "auto";
    cores = 0;
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
  services.udisks2.enable = true; # Auto-mounts external storage
}
