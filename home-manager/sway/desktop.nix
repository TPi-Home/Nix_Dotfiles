{
  # Desktop display settings: 3440x1440 ultrawide.
  home.pointerCursor.size = 24;

  xdg.configFile."sway/config".text =
    builtins.replaceStrings
      ["@CURSOR_SIZE@"]
      ["24"]
      (builtins.readFile ../../home/.config/sway/config);
}
