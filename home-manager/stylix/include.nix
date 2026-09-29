# ============================================================================
# Stylix Enable
# ============================================================================
{pkgs, ...}: {
  stylix = {
    enable = true;
    autoEnable = false;

    base16Scheme = ../../home/.config/stylix/astrodark.yaml;

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
}