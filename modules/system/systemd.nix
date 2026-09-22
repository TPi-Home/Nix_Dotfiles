# ============================================================================
# Systemd Services and Service Hardening
# ============================================================================
  
{...}:

{
systemd.services.greetd.serviceConfig = 
  {
    PrivateTmp = true;
    LockPersonality = true;
    RestrictRealtime = true;
    RestrictSUIDSGID = true;
    SystemCallArchitectures = "native";

    ProtectClock = true;
    ProtectKernelLogs = true;
    ProtectKernelModules = true;

    NoNewPrivileges = true;
    RestrictNamespaces = true;
  };
}