# ============================================================================
# Stylix Enable
# ============================================================================

{ config, ... }:

{
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