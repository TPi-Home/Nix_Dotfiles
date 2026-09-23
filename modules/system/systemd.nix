# ============================================================================
# Systemd Services and Service Hardening
# ============================================================================

{ ... }:

{
  systemd.services.greetd.serviceConfig = {
    PrivateTmp = true;
    LockPersonality = true;
    RestrictRealtime = true;
    RestrictSUIDSGID = true;
    SystemCallArchitectures = "native";

    ProtectClock = true;
    ProtectKernelLogs = true;
    ProtectKernelModules = true;

    RestrictNamespaces = true;
  };

  # For:
  # NIXOS_OZONE_WL = "1";
  # Try:
  # services.logind.killUserProcesses = true;

}
