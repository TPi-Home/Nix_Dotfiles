# ============================================================================
# Systemd Services and Service Hardening
# ============================================================================

{ ... }:

{
  systemd.services.greetd.serviceConfig = 
  {
    PrivateTmp = true;

    ProtectClock = true;
    ProtectKernelLogs = true;
    ProtectKernelModules = true;

    LockPersonality = true;
    SystemCallArchitectures = "native";
    RestrictSUIDSGID = true;
  };
}