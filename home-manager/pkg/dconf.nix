{ ... }:

{
  gtk = {
    enable = true;

    gtk4 = {
      enable = true;
      colorScheme = "dark";
    };
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };
}