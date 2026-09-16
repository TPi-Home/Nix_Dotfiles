# ============================================================================
# greetd / ReGreet
# ============================================================================

{ pkgs, ... }:

{
  # --------------------------------------------------------------------------
  # ReGreet
  # --------------------------------------------------------------------------

  programs.regreet = {
    enable = true;

    theme.name = "Adwaita";

    font = {
      name = "Monaspace Neon";
      size = 16;
    };

    cursorTheme.name = "Adwaita";
  };


  # --------------------------------------------------------------------------
  # greetd
  # --------------------------------------------------------------------------

  services.greetd = {
    enable = true;

    settings = {
      default_session = {
        command = "${pkgs.sway}/bin/sway --config /etc/greetd/sway-config";
        user = "greeter";
      };
    };
  };


  # --------------------------------------------------------------------------
  # ReGreet dependencies
  # --------------------------------------------------------------------------

  environment.systemPackages = with pkgs; [
    adwaita-icon-theme
    cantarell-fonts
  ];


  # --------------------------------------------------------------------------
  # greetd Sway configuration
  # --------------------------------------------------------------------------

  environment.etc."greetd/sway-config".text = ''
    exec "${pkgs.regreet}/bin/regreet; ${pkgs.sway}/bin/swaymsg exit"
  '';
}