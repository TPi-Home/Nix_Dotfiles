# ============================================================================
# Stylix Enable
# ============================================================================

{ config, ... }:

{
  stylix = {
    enable = true;
    autoEnable = false;

    base16Scheme = ../../home/.config/stylix/astrodark.yaml;

    targets = {
      gtk.enable = true;
      waybar.enable = false;
    };
  };
}