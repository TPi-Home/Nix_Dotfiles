{pkgs, ...}:

{
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        user = "greeter";
        command = getExe' pkgs.tuigreet "tuigreet"; # you may pass `--config` here
      };
    };
  };
}