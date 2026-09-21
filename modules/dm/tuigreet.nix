{ pkgs, ... }:

{
  services.greetd = {
    enable = true;

    settings = {
      default_session = {
        user = "greeter";
        command =
          "${pkgs.tuigreet}/bin/tuigreet "
          + "--sessions /run/current-system/sw/share/wayland-sessions "
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
#           + "--theme 'border=bright-blue;text=white;time=magenta;container=black;title=bright-blue;greet=white;prompt=bright-blue;input=white;action=bright-blue;button=magenta' "

  environment.systemPackages = with pkgs; [
    tuigreet
  ];
}