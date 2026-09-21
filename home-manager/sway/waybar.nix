{ ... }:

{
  programs.waybar = {
    enable = true;
    systemd.enable = true;

    style = ../../home/.config/waybar/style.css;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";

        height = 54;
        margin-top = 8;
        margin-left = 8;
        margin-right = 8;
        margin-bottom = 0;

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
          "power-profiles-daemon"
          "tray"
        ];

        # --------------------------------------------------------------------
        # Workspaces
        # --------------------------------------------------------------------

        "sway/workspaces" = {
          disable-scroll = true;
          all-outputs = true;

          format = "{windows}";

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

          window-rewrite-default = "";

          window-rewrite = {
            "class<firefox>" = "󰈹";
            "class<kitty>" = "󰄛";
            "class<Code>" = "󰨞";
            "class<code>" = "󰨞";
            "class<discord>" = "󰙯";
            "class<signal>" = "󰭻";
            "class<Signal>" = "󰭻";
            "class<thunderbird>" = "󰇮";
            "class<vlc>" = "󰕼";
            "class<obsidian>" = "󰠮";
            "class<gimp>" = "󰏘";
            "class<qbittorrent>" = "󰇚";
            "class<org.qbittorrent.qBittorrent>" = "󰇚";
            "class<steam>" = "󰓓";
            "class<Steam>" = "󰓓";
            "class<spotify>" = "󰓇";
            "class<emacs>" = "󰰮";
            "class<Alacritty>" = "󰄛";
            "class<foot>" = "󰆍";
          };

          format-window-separator = "  ";

          sort-by-number = true;
        };

        # --------------------------------------------------------------------
        # Network
        # --------------------------------------------------------------------

        network = {
          interval = 5;

          format-wifi = "";
          format-ethernet = "  ";
          format-linked = "  ";
          format-disconnected = "  ";

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
          format-muted = "  ";

          tooltip-format = "{desc}\nVolume: {volume}%";

          format-icons = {
            headphone = "";
            headset = "󰋏";
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
          bat = "BAT0";

          format = "{icon} {capacity}%";
          format-charging = "󰂄 {capacity}%";
          format-plugged = "󰂄 {capacity}%";
          format-full = "󰁹 {capacity}%";

          format-icons = [
            "󰁺"
            "󰁻"
            "󰁼"
            "󰁽"
            "󰁹"
          ];
        };

        # --------------------------------------------------------------------
        # Power Profile
        # --------------------------------------------------------------------

        "power-profiles-daemon" = {
          format = "{icon} {profile}";
          tooltip-format = "Power profile: {profile}\nDriver: {driver}";
          format-icons = {
            performance = "󰓅";
            balanced = "󰗑";
            "power-saver" = "󰌪";
          };
        };

        # --------------------------------------------------------------------
        # Clock
        # --------------------------------------------------------------------
        
        clock = {
          format = "{:%H:%M}";
        };

        # --------------------------------------------------------------------
        # System tray
        # --------------------------------------------------------------------

        tray = {
          icon-size = 28;
          spacing = 7;
        };
      };
    };
  };
}
