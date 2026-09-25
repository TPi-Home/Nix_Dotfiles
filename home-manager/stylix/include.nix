# ============================================================================
# Stylix Enable
# ============================================================================

{ config, ... }:

{
  gtk.enable = true;

  stylix = {
    enable = true;
    autoEnable = false;

    base16Scheme = ../../home/.config/stylix/onedark.yaml;

    targets = {
      gtk.enable = true;
      waybar.enable = false;
    };
  };
}