{ pkgs, ... }:

{
  gtk = {
    enable = true;

    gtk3 = {
      enable = true;
      colorScheme = "dark";

      theme = {
        package = pkgs.gnome-themes-extra;
        name = "Adwaita";
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
    };
  };
}