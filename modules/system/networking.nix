# ============================================================================
# Networking
# ============================================================================
{
  pkgs,
  config,
  ...
}: {
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  networking.networkmanager.wifi.macAddress = "random";
  networking.firewall.enable = true;

  #  services.zerotierone = {
  #    enable = true;
  #    joinNetworks = [
  #      "YOUR_NETWORK_ID_HERE"
  #    ];
  #  };

  environment.systemPackages = with pkgs; [
    # --------------------------------------------------------------------------
    # General
    # --------------------------------------------------------------------------

    proton-vpn-cli
    proton-vpn
  ];
}
