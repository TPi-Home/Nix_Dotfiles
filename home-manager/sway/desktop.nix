{
  xdg.configFile."sway/config".text = builtins.replaceStrings [ "@CURSOR_SIZE@" ] [ "24" ] (
    builtins.readFile ../../home/.config/sway/config
  );
}
