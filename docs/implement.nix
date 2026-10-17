# Historical scratchpad only. This file is not imported by flake.nix.
# It describes an older systemd-managed Kanshi service and references another
# user's home directory. Do not copy it as-is.
#
# The active configuration installs Kanshi through
# home-manager/programs/services/kanshi.nix, defines output profiles in
# home-manager/kanshi/<host>.nix, and starts Kanshi from the Sway config.

systemd.user.services.kanshi = {
  description = "Kanshi output autoconfig";
  wantedBy = [ "graphical-session.target" ];
  partOf = [ "graphical-session.target" ];
  environment = {
    XDG_CONFIG_HOME = "/home/mschwaig/.config";
  };
  serviceConfig = {
    ExecStart = `${pkgs.kanshi}/bin/kanshi`;
    RestartSec = 5;
    Restart = "always";
  };
};
