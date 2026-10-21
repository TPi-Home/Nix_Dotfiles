
# ============================================================================
# NVIDIA / Graphics
# ============================================================================
{ config, lib, pkgs, ... }:

let
  nvidiaSmiCompat = pkgs.writeShellScriptBin "nvidia-smi" ''
    exec ${pkgs.coreutils}/bin/env \
      LD_LIBRARY_PATH=/run/opengl-driver/lib \
      ${config.hardware.nvidia.package.bin}/origBin/nvidia-smi "$@"
  '';
in
{
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    open = true;
    modesetting.enable = true;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.latest;
    powerManagement.enable = true;
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

   environment.systemPackages = [
    (lib.hiPrio nvidiaSmiCompat)
   ];

  environment.sessionVariables = {
    SWAY_UNSUPPORTED_GPU = "1";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    WLR_NO_HARDWARE_CURSORS = "1";
  };
}
