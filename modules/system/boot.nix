# ============================================================================
# Boot
# ============================================================================
{ ... }: {
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.edk2-uefi-shell.enable = true;
}
