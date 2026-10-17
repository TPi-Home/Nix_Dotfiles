{
  # Desktop display settings: 3440x1440 ultrawide.
  home.pointerCursor.size = 24;

  wayland.windowManager.hyprland.extraConfig = ''
    hl.on("hyprland.start", function()
      hl.exec_cmd('hyprctl keyword monitor "LG Electronics LG ULTRAGEAR 110NTRLAS678,3440x1440@160,0x0,1.0"')
    end)
  '';
}
