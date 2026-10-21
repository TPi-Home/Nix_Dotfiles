{
  wayland.windowManager.hyprland.extraConfig = ''
    hl.on("hyprland.start", function()
      hl.exec_cmd('hyprctl keyword monitor "EDO EF10QBC64.C Unknown,2560x1600@165,0x0,1.0"')
    end)
  '';
}
