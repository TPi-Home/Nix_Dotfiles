# ============================================================================
# ReGreet - Hyprland-style rounded theme
# ============================================================================

{ pkgs, ... }:

{
  services.displayManager.regreet = {
    enable = true;

    package = pkgs.swayfx;

    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };

    font = {
      name = "Monaspace Neon NF";
      size = 16;
    };

    cursorTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
    };

    extraCss = ''
      * {
        font-family: "Monaspace Neon NF";
        font-size: 16px;
        color: #ADB0BB;
      }

      window {
        background: transparent;
      }

      label {
        color: #ADB0BB;
      }

      box {
        color: #ADB0BB;
      }

      /* Main panel */

      window > box {
        background: alpha(#111317, 0.88);

        border: 1px solid alpha(#50A4E9, 0.20);
        border-radius: 32px;

        box-shadow:
          0 20px 50px alpha(#111317, 0.48),
          0 0 0 1px alpha(#CC83E3, 0.035);
      }

      /* Entries / selectors */

      entry,
      combobox button {
        min-height: 50px;

        padding-left: 16px;
        padding-right: 16px;

        background: alpha(#1A1D23, 0.94);
        color: #ADB0BB;

        border: 1px solid #3A3E47;
        border-radius: 22px;

        box-shadow:
          inset 0 1px alpha(#ADB0BB, 0.025),
          0 5px 18px alpha(#111317, 0.24);
      }

      entry:hover,
      combobox button:hover {
        background: #1E222A;
        border-color: alpha(#50A4E9, 0.38);
      }

      entry:focus,
      combobox button:focus {
        border: 1px solid #50A4E9;

        box-shadow:
          0 0 0 2px alpha(#50A4E9, 0.12),
          0 8px 24px alpha(#111317, 0.30);
      }

      entry selection {
        background: #26343F;
        color: #5EB7FF;
      }

      /* Generic buttons */

      button {
        min-height: 46px;

        padding-left: 16px;
        padding-right: 16px;

        background: #16181D;
        color: #ADB0BB;

        border: 1px solid #3A3E47;
        border-radius: 22px;

        box-shadow:
          0 5px 16px alpha(#111317, 0.22);
      }

      button:hover {
        background: #23272F;
        color: #ADB0BB;
        border-color: alpha(#50A4E9, 0.42);

        box-shadow:
          0 7px 22px alpha(#111317, 0.28);
      }

      button:active {
        background: #26343F;
        border-color: #50A4E9;

        box-shadow:
          inset 0 2px 5px alpha(#111317, 0.30);
      }

      /* Login / primary action */

      button.suggested-action {
        min-width: 105px;
        min-height: 50px;

        background: #50A4E9;
        color: #111317;

        border: 1px solid #50A4E9;
        border-radius: 999px;

        font-weight: 700;

        box-shadow:
          0 8px 24px alpha(#50A4E9, 0.20),
          0 5px 16px alpha(#111317, 0.28);
      }

      button.suggested-action:hover {
        background: #5EB7FF;
        color: #111317;
        border-color: #5EB7FF;

        box-shadow:
          0 9px 28px alpha(#5EB7FF, 0.24),
          0 5px 16px alpha(#111317, 0.30);
      }

      button.suggested-action:active {
        background: #50A4E9;
        border-color: #50A4E9;

        box-shadow:
          inset 0 2px 6px alpha(#111317, 0.24);
      }

      /* Circular controls */

      button.circular {
        min-width: 44px;
        min-height: 44px;

        padding: 0;

        background: #16181D;
        color: #9B9FA9;

        border: 1px solid #3A3E47;
        border-radius: 999px;

        box-shadow:
          0 4px 14px alpha(#111317, 0.22);
      }

      button.circular:hover {
        background: #1E222A;
        color: #5EB7FF;
        border-color: alpha(#50A4E9, 0.45);

        box-shadow:
          0 6px 20px alpha(#111317, 0.28);
      }

      /* Power controls */

      button.destructive-action,
      button.flat {
        min-height: 42px;

        padding-left: 14px;
        padding-right: 14px;

        background: alpha(#16181D, 0.90);
        color: #9B9FA9;

        border: 1px solid #3A3E47;
        border-radius: 999px;

        box-shadow:
          0 4px 14px alpha(#111317, 0.20);
      }

      button.destructive-action:hover,
      button.flat:hover {
        background: #23272F;
        color: #ADB0BB;
        border-color: alpha(#CC83E3, 0.42);
      }

      /* Dropdowns / menus */

      popover {
        background: transparent;
      }

      popover contents,
      menu {
        background: #14161B;
        color: #ADB0BB;

        border: 1px solid #3A3E47;
        border-radius: 22px;

        box-shadow:
          0 16px 44px alpha(#111317, 0.48);
      }

      row {
        padding: 7px;
        border-radius: 16px;
      }

      row:hover {
        background: #23272F;
      }

      row:selected {
        background: #26343F;
        color: #5EB7FF;
      }

      /* Checkbox */

      checkbutton {
        color: #9B9FA9;
      }

      checkbutton check {
        min-width: 20px;
        min-height: 20px;

        background: #16181D;

        border: 1px solid #3A3E47;
        border-radius: 7px;
      }

      checkbutton check:checked {
        background: #50A4E9;
        color: #111317;
        border-color: #50A4E9;
      }

      /* Icons */

      image {
        color: #9B9FA9;
      }

      /* Scrollbars */

      scrollbar {
        background: transparent;
      }

      scrollbar slider {
        min-width: 5px;
        min-height: 5px;

        background: alpha(#9B9FA9, 0.22);
        border-radius: 999px;
      }

      scrollbar slider:hover {
        background: alpha(#50A4E9, 0.55);
      }

      /* Tooltips */

      tooltip {
        background: alpha(#111317, 0.97);
        color: #ADB0BB;

        border: 1px solid alpha(#50A4E9, 0.18);
        border-radius: 14px;

        box-shadow:
          0 8px 24px alpha(#111317, 0.42);
      }

      tooltip label {
        color: #ADB0BB;
      }
    '';

    settings = {
      GTK = {
        application_prefer_dark_theme = true;
        cursor_theme_name = "Adwaita";
        cursor_blink = true;
        font_name = "Monaspace Neon NF 16";
        icon_theme_name = "Adwaita";
        theme_name = "Adwaita-dark";
      };

      env = {
        XCURSOR_SIZE = "36";
      };

      appearance = {
        greeting_msg = "Welcome back!";
      };

      background = {
        path = "${../../Hilltopper.png}";
        fit = "Cover";
      };

      commands = {
        reboot = [ "systemctl" "reboot" ];
        poweroff = [ "systemctl" "poweroff" ];
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

  fonts.packages = with pkgs; [
    nerd-fonts.monaspace
  ];

  environment.systemPackages = with pkgs; [
    adwaita-icon-theme
    gnome-themes-extra
  ];

  environment.etc."greetd/sway-config".text = ''
    set $SWAYSOCK /run/user/$(id -u)/sway-ipc.sock
    set $mod Mod4

    seat seat0 xcursor_theme Adwaita 36
    input type:keyboard xkb_numlock enabled

    output * scale 1

    exec "${pkgs.regreet}/bin/regreet; ${pkgs.swayfx}/bin/swaymsg exit"
  '';
  
}