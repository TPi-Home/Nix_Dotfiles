{ pkgs, ... }:

{
  services.displayManager.regreet = {
    enable = true;

    package = pkgs.swayfx;

    theme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
    };

    font = {
      name = "Cantarell";
      size = 16;
    };

    cursorTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
    };

    extraCss = ''
      /* ---------------------------------------------------------------
         ReGreet
         Dark GNOME-like appearance with purple accent
         --------------------------------------------------------------- */

      * {
        font-family: "Cantarell";
        font-size: 16px;
      }

      window {
        background-color: #1e1b2e;
      }

      label {
        color: #f0edf7;
      }

      /* Main login panel */
      window > box {
        background-color: #28243d;
        border: 1px solid #40395c;
        border-radius: 16px;
        padding: 32px;
      }

      /* Username/password fields */
      entry {
        min-height: 42px;
        padding: 0 14px;

        color: #f0edf7;
        background-color: #211e32;

        border: 1px solid #40395c;
        border-radius: 10px;
      }

      entry:focus {
        border-color: #b58cff;
        box-shadow: 0 0 0 2px alpha(#b58cff, 0.25);
      }

      /* Session/user dropdowns */
      combobox button {
        min-height: 42px;
        padding: 0 14px;

        color: #f0edf7;
        background-color: #211e32;

        border: 1px solid #40395c;
        border-radius: 10px;
      }

      combobox button:hover {
        background-color: #302b48;
      }

      /* Login button */
      button {
        min-height: 42px;
        padding: 0 18px;

        color: #ffffff;
        background-color: #7c4dff;

        border: none;
        border-radius: 10px;
      }

      button:hover {
        background-color: #8d63ff;
      }

      button:active {
        background-color: #6d3fee;
      }

      /* Clock */
      .clock {
        color: #f0edf7;
      }

      /* Secondary text */
      .dim-label {
        color: #aaa3bd;
      }

      /* Power/reboot buttons */
      image {
        color: #c9c1d9;
      }
    '';

    settings = {
      GTK = {
        application_prefer_dark_theme = true;
        cursor_theme_name = "Adwaita";
        cursor_blink = true;
        font_name = "Cantarell 16";
        icon_theme_name = "Adwaita";
        theme_name = "Adwaita";
      };

      env = {
        XCURSOR_SIZE = "24";
      };

      appearance = {
        greeting_msg = "Welcome back!";
      };
    };
  };

  services.greetd = {
    enable = true;

    settings = {
      default_session = {
        command =
          "${pkgs.swayfx}/bin/sway --unsupported-gpu --config /etc/greetd/sway-config";
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