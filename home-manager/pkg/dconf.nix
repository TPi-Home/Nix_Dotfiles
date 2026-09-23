{ ... }:

{
  gtk = {
    enable = true;

    gtk3 = {
      enable = true;
      colorScheme = "dark";
      theme = {
        name = "Adwaita-dark";
      };
    };

    gtk4 = {
      enable = true;
      colorScheme = "dark";
    };
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      gtk-theme = "Adwaita-dark";
    };
  };
}