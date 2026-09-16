{ pkgs, ... }:

{
  home.sessionVariables = {
    MOZ_ENABLE_WAYLAND = "0";
  };

  programs.firefox = {
    enable = true;

    # Your existing Firefox configuration goes here.
    # For example:
    profiles.default = {
      isDefault = true;

      # Your existing settings...
    };
  };
}