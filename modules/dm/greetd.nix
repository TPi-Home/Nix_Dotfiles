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
      name = "Monaspace Neon NF";
      size = 16;
    };

    cursorTheme.name = "Adwaita";
  };


  # --------------------------------------------------------------------------
  # greetd
  # --------------------------------------------------------------------------

  services.greetd = {
    enable = true;

    # Optional settings:
    # settings = {
    #   background = {
    #     path = "/path/to/wallpaper.jpg";
    #     fit = "Cover";
    #   };
    # };

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
  ];


  # --------------------------------------------------------------------------
  # greetd Sway configuration
  # --------------------------------------------------------------------------

  environment.etc."greetd/sway-config".text = ''
    exec "${pkgs.regreet}/bin/regreet; ${pkgs.sway}/bin/swaymsg exit"
  '';
}