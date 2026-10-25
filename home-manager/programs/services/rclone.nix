# ============================================================================
# Rclone OneDrive Mount
# ============================================================================
{ pkgs, ... }:
{
  home.packages = with pkgs; [
    rclone
    fuse3
  ];

  systemd.user.services.rclone-onedrive = {
    Unit = {
      Description = "Mount OneDrive using Rclone";
    };

    Service = {
      Type = "notify";

      ExecStartPre = "${pkgs.coreutils}/bin/mkdir -p %h/OneDrive";

      ExecStart = ''
        ${pkgs.rclone}/bin/rclone mount OneDrive: %h/OneDrive \
          --config %h/.config/rclone/rclone.conf \
          --vfs-cache-mode writes
      '';

      ExecStop = "${pkgs.fuse3}/bin/fusermount3 -uz %h/OneDrive";

      Restart = "on-failure";
      RestartSec = 10;
    };

    Install.WantedBy = [ "default.target" ];
  };
}