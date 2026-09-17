{ ... }:

{
  programs.waybar = {
    enable = true;
    systemd.enable = true;

    style = ../../home/.config/waybar/style.css;

    settings = {
      mainBar = {
        layer = "top";
        position = "bottom";

        height = 34;

        margin-left = 8;
        margin-right = 8;
        margin-bottom = 6;

        spacing = 0;

        reload_style_on_change = true;

        modules-left = [
          "sway/workspaces"
        ];

        modules-center = [
        ];

        modules-right = [
          "network"
          "pulseaudio"
          "battery"
          "clock"
          "tray"
        ];

        # --------------------------------------------------------------------
        # Workspaces
        # --------------------------------------------------------------------

        "sway/workspaces" = {
          disable-scroll = true;
          all-outputs = true;

          format = "{icon}";

          persistent_workspaces = {
            "1" = [];
            "2" = [];
            "3" = [];
            "4" = [];
            "5" = [];
            "6" = [];
            "7" = [];
            "8" = [];
            "9" = [];
            "10" = [];
          };

          format-icons = {
            "1" = "󰋜";
            "2" = "󰖟";
            "3" = "󰠮";
            "4" = "󰭹";
            "5" = "󱓷";
            "6" = "󱇧";
            "7" = "󰊢";
            "8" = "󰖲";
            "9" = "󰕧";
            "10" = "󰝚";

            urgent = "";
            default = "";
          };

          sort-by-number = true;
        };

        # --------------------------------------------------------------------
        # Network
        # --------------------------------------------------------------------

        network = {
          interval = 5;

          format-wifi = "";
          format-ethernet = "󰈀";
          format-linked = "󰛵";
          format-disconnected = "󰤮";

          tooltip-format-wifi = "{essid}\nSignal: {signalStrength}%\nInterface: {ifname}";
          tooltip-format-ethernet = "Ethernet\n{ifname}\n{ipaddr}/{cidr}";
          tooltip-format-disconnected = "Disconnected";

          format-alt = "{ifname}: {ipaddr}/{cidr}";
        };

        # --------------------------------------------------------------------
        # Audio
        # --------------------------------------------------------------------

        pulseaudio = {
          scroll-step = 2;

          format = "{icon}";
          format-muted = "󰖁";

          tooltip-format = "{desc}\nVolume: {volume}%";

          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";

            default = [
              ""
              ""
              ""
            ];
          };

          on-click = "pavucontrol";
        };

        # --------------------------------------------------------------------
        # Battery
        # --------------------------------------------------------------------

        battery = {
          states = {
            warning = 30;
            critical = 15;
          };

          format = "{icon} {capacity}%";
          format-charging = "󰂄 {capacity}%";
          format-plugged = "󰂄 {capacity}%";
          format-full = "󱈑 {capacity}%";

          format-alt = "{time} {icon}";

          format-icons = [
            "󱊡"
            "󱊢"
            "󱊣"
            "󱊤"
            "󱊥"
          ];

          tooltip-format = "{capacity}%\n{timeTo}\nStatus: {status}";
        };

        # --------------------------------------------------------------------
        # Clock
        # --------------------------------------------------------------------

        clock = {
          format = "󰸗 {:%b %d}   󰅐 {:%H:%M}";

          tooltip-format =
            "<big>{:%A, %B %d, %Y}</big>\n\n"
            + "<tt><small>{calendar}</small></tt>";

          format-alt = "{:%Y-%m-%d %H:%M:%S}";

          calendar = {
            mode = "month";
            mode-mon-col = 3;
            weeks-pos = "right";

            on-scroll = 1;

            format = {
              months = "<span color='#cba6f7'><b>{}</b></span>";
              days = "<span color='#cdd6f4'><b>{}</b></span>";
              weeks = "<span color='#89b4fa'><b>W{}</b></span>";
              weekdays = "<span color='#94e2d5'><b>{}</b></span>";
              today = "<span color='#f5c2e7'><b><u>{}</u></b></span>";
            };
          };

          actions = {
            on-click = "mode";
            on-scroll-up = "shift_up";
            on-scroll-down = "shift_down";
          };
        };

        # --------------------------------------------------------------------
        # System tray
        # --------------------------------------------------------------------

        tray = {
          icon-size = 18;
          spacing = 8;
        };
      };
    };
  };
}