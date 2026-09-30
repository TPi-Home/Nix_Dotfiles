# ============================================================================
# Stylix Enable
# ============================================================================
{
  lib,
  pkgs,
  ...
}: {
  stylix = {
    enable = true;
    autoEnable = false;

    base16Scheme = ../../home/.config/stylix/astrodark_gtk.yaml;
    polarity = "dark";

    icons = {
      enable = true;
      package = pkgs.vimix-icon-theme;
      dark = "Vimix-doder";
    };

    targets = {
      gtk.enable = true;
      waybar.enable = false;
    };
  };

  gtk.theme = lib.mkForce {
    package = pkgs.adw-gtk3;
    name = "adw-gtk3-dark";
  };
}
