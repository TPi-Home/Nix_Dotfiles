# ============================================================================
# TUIGreet
# ============================================================================

{ config, pkgs, ... }:

{
  services.greetd = 
  {
    enable = true;

    settings = 
    {
      default_session = 
      {
        user = "greeter";
        command =
          "${pkgs.tuigreet}/bin/tuigreet "
          + "--sessions ${config.services.displayManager.sessionData.desktops}/share/wayland-sessions "
          + "--session-wrapper 'systemd-run --user --scope --unit=wayland-session' "
          + "--time "
          + "--time-format '%a %b %d  %H:%M' "
          + "--greeting 'Welcome back!' "
          + "--remember "
          + "--remember-session "
          + "--asterisks "
          + "--greet-align center "
          + "--window-padding 2 "
          + "--container-padding 1 "
          + "--prompt-padding 1 "
          + "--power-shutdown 'systemctl poweroff' "
          + "--power-reboot 'systemctl reboot'";
      };
    };
  };

  systemd.services.greetd.serviceConfig = {
    Type = "idle";

    StandardInput = "tty";
    StandardOutput = "tty";
    StandardError = "journal";

    TTYReset = true;
    TTYVHangup = true;
    TTYVTDisallocate = true;
  };
  
  environment.systemPackages = with pkgs; 
  [
    tuigreet
  ];
}
