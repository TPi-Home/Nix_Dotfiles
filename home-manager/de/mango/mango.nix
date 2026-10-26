# ============================================================================
# Mango
# ============================================================================
{ ... }:
{
  wayland.windowManager.mango = {
    enable = true;

    systemd = {
      enable = true;
      variables = [ "--all" ];
    };

    settings = builtins.readFile ../../../home/.config/mango/config.conf;

    autostart_sh = ''
      systemctl --user reset-failed
      systemctl --user start mango-session.target
    '';
  };

  # Ensure graphical-session services start with Mango.
  systemd.user.targets.mango-session = {
    Unit = {
      Wants = [ "graphical-session.target" ];
      After = [ "graphical-session.target" ];
    };
  };
}
