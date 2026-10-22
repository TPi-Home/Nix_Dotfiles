# ============================================================================
# Networking
# ============================================================================
{ pkgs, ... }: {
  networking.networkmanager.enable = true;
  networking.firewall.enable = true;

  networking.networkmanager.wifi = {
    macAddress = "stable";
    scanRandMacAddress = true;
  };

  # Switch over to this
  services.tailscale.enable = false;

  services.zerotierone = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    proton-vpn-cli
    proton-vpn
  ];
}
