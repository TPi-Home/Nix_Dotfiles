{ pkgs, ... }:

{
  services.displayManager.regreet = {
    enable = true;

    package = pkgs.swayfx;

    theme.name = "Adwaita";

    font = {
      name = "Monaspace Neon NF";
      size = 16;
    };

    cursorTheme.name = "Adwaita";

    settings = {
      GTK = {
        cursor_theme_name = "Adwaita";
      };

      env = {
        XCURSOR_SIZE = "24";
      };
    };
  };

  services.greetd = {
    enable = true;

    settings = {
      default_session = {
        command = "${pkgs.swayfx}/bin/sway --unsupported-gpu --config /etc/greetd/sway-config";
        user = "greeter";
      };
    };
  };

  environment.systemPackages = with pkgs; [
    adwaita-icon-theme
  ];

  environment.etc."greetd/sway-config".text = ''
    set $SWAYSOCK /run/user/$(id -u)/sway-ipc.sock

    seat seat0 xcursor_theme Adwaita 24

    exec "${pkgs.regreet}/bin/regreet; ${pkgs.swayfx}/bin/swaymsg exit"
  '';
}
