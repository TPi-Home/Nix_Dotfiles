{ pkgs, ... }:

{
  # Network
  networking.networkmanager.enable = true;

  # Bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  # Audio
  services.pipewire = {
    enable = true;

    alsa.enable = true;
    alsa.support32Bit = true;

    pulse.enable = true;
  };

  # Wayland portals
  xdg.portal = {
    enable = true;

    extraPortals = [
      pkgs.xdg-desktop-portal-wlr
    ];
  };

  # Polkit
  security.polkit.enable = true;

  # Wayland clipboard tools
  environment.systemPackages = with pkgs; [
    wl-clipboard
  ];
}