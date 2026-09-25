# ============================================================================
# Security
# ============================================================================

{pkgs, ... }:

{
  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;

    environment.systemPackages = with pkgs; 
  [

    # --------------------------------------------------------------------------
    #  Extra Security Packages
    # --------------------------------------------------------------------------
    bubblewrap
    polkit_gnome

  ];
}