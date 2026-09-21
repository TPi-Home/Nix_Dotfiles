{ pkgs, ... }:

{
  services.greetd = {
    enable = true;

    settings = {
      default_session = {
        user = "greeter";

        command = pkgs.lib.getExe pkgs.tuigreet;
      };
    };
  };

  environment.systemPackages = with pkgs; [
    tuigreet
  ];
}