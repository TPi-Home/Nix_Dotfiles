# ============================================================================
# Networking
# ============================================================================
{pkgs, ...}: {
  networking.networkmanager.enable = true;
  networking.firewall.enable = true;

  services.zerotierone = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    proton-vpn-cli
    proton-vpn
  ];
}
