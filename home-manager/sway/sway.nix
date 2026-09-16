{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Network / Bluetooth
    networkmanagerapplet
    blueman

    # Launcher / bar
    wofi
    waybar

    # Wallpaper / idle / locking
    swaybg
    swayidle
    swaylock

    # Hardware controls
    brightnessctl

    # Audio
    pavucontrol

    # Screenshots
    grim
    slurp

    # Notifications
    mako

    # Polkit authentication
    polkit_gnome

    # Logout menu
    wlogout

    # Terminal
    kitty

    # GTK / Qt configuration
    nwg-look
    qt6ct

    # CLI file manager
    yazi

    # Cursor
    adwaita-icon-theme
  ];

  # Cursor
  home.pointerCursor = {
    enable = true;

    package = pkgs.adwaita-icon-theme;
    name = "Adwaita";
    size = 24;

    gtk.enable = true;
    # x11.enable = true;
  };

  wayland.windowManager.sway = {
    enable = true;

    wrapperFeatures.gtk = true;

    config = {
      modifier = "Mod4";

      terminal = "kitty";
      menu = "wofi --show drun";

      # Startup applications
      startup = [
        { command = "waybar"; }
        { command = "mako"; }
        { command = "nm-applet"; }
        { command = "blueman-applet"; }
        { command = "swaybg -i ${config.home.homeDirectory}/Pictures/wallpaper.jpg -m fill"; }
        { command = "swayidle -w"; }
        {
          command =
            "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        }
      ];

      # Input
      input = {
        "*" = {
          xkb_layout = "us";
        };
      };

      # Outputs
      output = {
        "*" = {
          bg = "${config.home.homeDirectory}/Pictures/wallpaper.jpg fill";
        };
      };

      # Appearance
      gaps = {
        inner = 5;
        outer = 10;
      };

      fonts = {
        names = [ "Sans" ];
        size = 10.0;
      };

      # Keybindings
      keybindings = {
        # Applications
        "$mod+Return" = "exec kitty";
        "$mod+d" = "exec wofi --show drun";

        # Window management
        "$mod+q" = "kill";
        "$mod+f" = "fullscreen toggle";
        "$mod+Shift+space" = "floating toggle";

        # Focus
        "$mod+h" = "focus left";
        "$mod+j" = "focus down";
        "$mod+k" = "focus up";
        "$mod+l" = "focus right";

        # Move windows
        "$mod+Shift+h" = "move left";
        "$mod+Shift+j" = "move down";
        "$mod+Shift+k" = "move up";
        "$mod+Shift+l" = "move right";

        # Workspaces
        "$mod+1" = "workspace number 1";
        "$mod+2" = "workspace number 2";
        "$mod+3" = "workspace number 3";
        "$mod+4" = "workspace number 4";
        "$mod+5" = "workspace number 5";
        "$mod+6" = "workspace number 6";
        "$mod+7" = "workspace number 7";
        "$mod+8" = "workspace number 8";
        "$mod+9" = "workspace number 9";

        # Move windows to workspaces
        "$mod+Shift+1" = "move container to workspace number 1";
        "$mod+Shift+2" = "move container to workspace number 2";
        "$mod+Shift+3" = "move container to workspace number 3";
        "$mod+Shift+4" = "move container to workspace number 4";
        "$mod+Shift+5" = "move container to workspace number 5";
        "$mod+Shift+6" = "move container to workspace number 6";
        "$mod+Shift+7" = "move container to workspace number 7";
        "$mod+Shift+8" = "move container to workspace number 8";
        "$mod+Shift+9" = "move container to workspace number 9";

        # Screenshot
        "Print" =
          "exec grim ~/Pictures/Screenshots/$(date +'%Y-%m-%d_%H-%M-%S').png";

        "Shift+Print" =
          "exec grim -g \"$(slurp)\" ~/Pictures/Screenshots/$(date +'%Y-%m-%d_%H-%M-%S').png";

        # Lock
        "$mod+shift+l" = "exec swaylock";

        # Exit Sway
        "$mod+Shift+e" = "exec wlogout";

        # Volume
        "XF86AudioRaiseVolume" =
          "exec wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%+";

        "XF86AudioLowerVolume" =
          "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";

        "XF86AudioMute" =
          "exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";

        # Brightness
        "XF86MonBrightnessUp" =
          "exec brightnessctl set 5%+";

        "XF86MonBrightnessDown" =
          "exec brightnessctl set 5%-";
      };

      # Bar
      bars = [
        {
          command = "waybar";
        }
      ];
    };
  };

  # Notifications
  services.mako = {
    enable = true;

    settings = {
      default-timeout = 5000;
      width = 400;
      height = 150;

      padding = 10;
      margin = 10;

      border-size = 1;
      border-radius = 8;

      icons = true;
    };
  };

  # Idle handling
  services.swayidle = {
    enable = true;

    events = {
      before-sleep = "${pkgs.swaylock}/bin/swaylock -f";
      lock = "${pkgs.swaylock}/bin/swaylock -f";
      after-resume = "swaymsg 'output * power on'";
    };

    timeouts = [
      {
        timeout = 300;
        command = "${pkgs.swaylock}/bin/swaylock -f";
      }

      {
        timeout = 600;
        command = "swaymsg 'output * power off'";
        resumeCommand = "swaymsg 'output * power on'";
      }
    ];
  };

  # Waybar
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 32;

        modules-left = [
          "sway/workspaces"
        ];

        modules-center = [
          "sway/window"
        ];

        modules-right = [
          "network"
          "bluetooth"
          "pulseaudio"
          "backlight"
          "battery"
          "clock"
          "tray"
        ];

        "sway/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
        };

        "sway/window" = {
          max-length = 60;
        };

        network = {
          format-wifi = "󰤨 {essid}";
          format-ethernet = "󰈀 {ipaddr}";
          format-disconnected = "󰤭";
        };

        bluetooth = {
          format = "󰂯 {status}";
          format-disabled = "󰂲";
        };

        pulseaudio = {
          format = "{icon} {volume}%";
          format-muted = "󰝟 muted";

          format-icons = [
            "󰕿"
            "󰖀"
            "󰕾"
          ];
        };

        backlight = {
          format = "󰃠 {percent}%";
        };

        battery = {
          format = "{icon} {capacity}%";

          format-icons = [
            "󰁺"
            "󰁻"
            "󰁼"
            "󰁽"
            "󰁾"
            "󰁿"
            "󰂀"
            "󰂁"
            "󰂂"
            "󰁹"
          ];
        };

        clock = {
          format = "{:%a %b %d  %I:%M %p}";
        };

        tray = {
          spacing = 8;
        };
      };
    };

    style = ''
      * {
        font-family: sans-serif;
        font-size: 14px;
      }

      window#waybar {
        background: rgba(30, 30, 30, 0.92);
      }

      #workspaces button {
        padding: 0 8px;
      }

      #workspaces button.focused {
        font-weight: bold;
      }

      #clock,
      #network,
      #bluetooth,
      #pulseaudio,
      #backlight,
      #battery,
      #tray {
        padding: 0 10px;
      }
    '';
  };

  # GTK theme configuration
  gtk = {
    enable = true;

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };
  };

  # Qt applications
  qt = {
    enable = true;
    platformTheme.name = "qtct";
    style.name = "Adwaita-Dark";
  };

  # Kitty
  programs.kitty = {
    enable = true;

    settings = {
      enable_audio_bell = false;
      confirm_os_window_close = 0;
      cursor_shape = "block";
      font_size = 11;
    };
  };
}