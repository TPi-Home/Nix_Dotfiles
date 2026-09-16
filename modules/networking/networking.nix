# ============================================================================
# Networking
# ============================================================================

{...}:

{
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  networking.networkmanager.wifi.macAddress = "random";
  networking.firewall.enable = true;
}