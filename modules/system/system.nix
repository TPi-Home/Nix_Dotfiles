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

  nix.settings = {
    # Experimental Features
    experimental-features = [
      "nix-command"
      "flakes"
    ];

    # Allow Nix to utilize multiple CPU cores when building from scratch
    max-jobs = "auto";
    cores = 0;

    # Binary Caches
    extra-substituters = [
      "https://noctalia.cachix.org"
    ];

    extra-trusted-public-keys = [
      "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
    ];
  };

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
