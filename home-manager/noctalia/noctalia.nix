{ pkgs, ... }: {

  programs.noctalia.enable = true;

  xdg.configFile."noctalia/palettes/AstroDark.json".source =
  ../../home/.config/noctalia/palettes/AstroDark.json;
}
