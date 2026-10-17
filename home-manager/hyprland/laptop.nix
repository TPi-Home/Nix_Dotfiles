{
  # Laptop display settings: 2560x1600 panel.
  home.pointerCursor.size = 36;

  wayland.windowManager.hyprland.extraConfig = ''
    hl.on("hyprland.start", function()
      hl.exec_cmd('hyprctl keyword monitor "EDO EF10QBC64.C Unknown,2560x1600@165,0x0,1.5"')
    end)
  '';
}
