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

    settings = {
      default_session = {
        command = "${pkgs.sway}/bin/sway --unsupported-gpu --config /etc/greetd/sway-config";
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
    set $SWAYSOCK /run/user/$(id -u)/sway-ipc.sock

    exec "${pkgs.regreet}/bin/regreet; ${pkgs.sway}/bin/swaymsg exit"
  '';
}