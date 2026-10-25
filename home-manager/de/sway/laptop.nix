{
  xdg.configFile."sway/config".text = builtins.replaceStrings [ "@CURSOR_SIZE@" ] [ "30" ] (
    builtins.readFile ../../../home/.config/sway/config
  );
}
