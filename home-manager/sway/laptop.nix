{
  # Laptop display settings: 2560x1600 panel.
  home.pointerCursor.size = 36;

  xdg.configFile."sway/config".text =
    builtins.replaceStrings
      ["@CURSOR_SIZE@"]
      ["36"]
      (builtins.readFile ../../home/.config/sway/config);
}
