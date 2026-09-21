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
        color: #dfdfdf;
      }

      window {
        background: transparent;
      }

      label {
        color: #dfdfdf;
        text-shadow: 0 1px 3px alpha(#000000, 0.20);
      }

      box {
        color: #dfdfdf;
      }

      /* Main panel - BLACK TRANSPARENT */
      window > box {
        background: alpha(#000000, 0.75);

        border: 1px solid alpha(#85befd, 0.20);
        border-radius: 32px;

        box-shadow:
            0 18px 48px alpha(#000000, 0.32),
            0 0 0 1px alpha(#85befd, 0.035);
      }

      /* Input / selection fields */
      entry,
      combobox button {
        min-height: 50px;

        padding-left: 18px;
        padding-right: 18px;

        background: alpha(#1a1a1a, 0.82);
        color: #dfdfdf;

        border: 1px solid alpha(#85befd, 0.20);
        border-radius: 22px;

        box-shadow:
            0 6px 22px alpha(#000000, 0.18),
            inset 0 1px alpha(#dfdfdf, 0.035);
      }

      entry:hover,
      combobox button:hover {
        background: alpha(#252525, 0.90);
        border-color: alpha(#85befd, 0.20);
      }

      entry:focus,
      combobox button:focus {
        border: 2px solid alpha(#85befd, 0.88);

        box-shadow:
            0 0 0 3px alpha(#85befd, 0.10),
            0 8px 28px alpha(#000000, 0.24);
      }

      entry selection {
        background: #85befd;
        color: #161718;
      }

      /* Generic buttons */
      button {
        min-height: 48px;

        padding-left: 18px;
        padding-right: 18px;

        background: alpha(#1a1a1a, 0.80);
        color: #dfdfdf;

        border: 1px solid alpha(#85befd, 0.14);
        border-radius: 22px;

        box-shadow:
            0 5px 18px alpha(#000000, 0.16);
      }

      button:hover {
        background: alpha(#252525, 0.95);
        border-color: alpha(#85befd, 0.24);

        box-shadow:
            0 7px 24px alpha(#000000, 0.20),
            0 0 0 1px alpha(#85befd, 0.08);
      }

      button:active {
        background: alpha(#85befd, 0.16);

        box-shadow:
            inset 0 2px 5px alpha(#000000, 0.18);
      }

      /* Login button */
      button.suggested-action {
        min-width: 105px;
        min-height: 52px;

        background: #85befd;
        color: #161718;

        border: none;
        border-radius: 999px;

        font-weight: 700;

        box-shadow:
            0 8px 26px alpha(#85befd, 0.26),
            0 4px 12px alpha(#000000, 0.18);
      }

      button.suggested-action:hover {
        background: #95cbfe;
        color: #161718;

        box-shadow:
            0 10px 32px alpha(#85befd, 0.34),
            0 5px 16px alpha(#000000, 0.20);
      }

      button.suggested-action:active {
        background: #85befd;

        box-shadow:
            inset 0 2px 6px alpha(#000000, 0.22);
      }

      /* Small circular icon/edit buttons */
      button.circular {
        min-width: 46px;
        min-height: 46px;

        padding: 0;

        background: alpha(#1a1a1a, 0.78);

        border: 1px solid alpha(#85befd, 0.12);
        border-radius: 999px;

        box-shadow:
            0 4px 14px alpha(#000000, 0.14);
      }

      button.circular:hover {
        background: alpha(#85befd, 0.14);

        border-color: alpha(#85befd, 0.18);

        box-shadow:
            0 0 0 1px alpha(#85befd, 0.18),
            0 6px 20px alpha(#000000, 0.18);
      }

      /* Reboot / Power Off - BLUE */
      button.destructive-action,
      button.flat {
        min-height: 42px;

        padding-left: 16px;
        padding-right: 16px;

        background: alpha(#1a1a1a, 0.66);
        color: #dfdfdf;

        border: 1px solid alpha(#85befd, 0.08);
        border-radius: 999px;

        box-shadow:
            0 5px 18px alpha(#000000, 0.16);
      }

      button.destructive-action:hover,
      button.flat:hover {
        background: alpha(#85befd, 0.13);

        border-color: alpha(#85befd, 0.18);
      }

      /* Dropdown / popovers */
      popover {
        background: transparent;
      }

      popover contents,
      menu {
        background: alpha(#1a1a1a, 0.96);
        color: #dfdfdf;

        border: 1px solid alpha(#85befd, 0.14);
        border-radius: 22px;

        box-shadow:
            0 16px 44px alpha(#000000, 0.34);
      }

      /* Menu rows */
      row {
        padding: 7px;
        border-radius: 16px;
      }

      row:hover {
        background: alpha(#85befd, 0.10);
      }

      row:selected {
        background: alpha(#85befd, 0.17);
        color: #dfdfdf;
      }

      /* Checkbox */
      checkbutton {
        color: #dfdfdf;
      }

      checkbutton check {
        min-width: 20px;
        min-height: 20px;

        background: alpha(#252525, 0.86);

        border: 1px solid alpha(#85befd, 0.35);
        border-radius: 7px;
      }

      checkbutton check:checked {
        background: #85befd;
        color: #161718;

        border-color: #85befd;
      }

      /* Icons */
      image {
        color: alpha(#dfdfdf, 0.82);
      }

      /* Scrollbars */
      scrollbar {
        background: transparent;
      }

      scrollbar slider {
        min-width: 5px;
        min-height: 5px;

        background: alpha(#dfdfdf, 0.25);

        border-radius: 999px;
      }

      scrollbar slider:hover {
        background: alpha(#85befd, 0.48);
      }

      /* Tooltips */
      tooltip {
        background: alpha(#000000, 0.96);
        color: #dfdfdf;

        border-radius: 14px;

        box-shadow:
            0 6px 20px alpha(#000000, 0.28);
      }

      tooltip label {
        color: #dfdfdf;
      }
    '';

    settings = {
      GTK = {
        application_prefer_dark_theme = true;
        cursor_theme_name = "Adwaita";
        cursor_blink = true;
        font_name = "Monaspace Neon NF 16";
        icon_theme_name = "Adwaita";
        theme_name = "Adwaita";
      };

      env = {
        XCURSOR_SIZE = "36";
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

    seat seat0 xcursor_theme Adwaita 36

    input type:keyboard xkb_numlock enabled

    output * scale 1 

    exec "${pkgs.regreet}/bin/regreet; ${pkgs.swayfx}/bin/swaymsg exit"
  '';
}
