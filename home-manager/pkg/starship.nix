# ============================================================================
# Starship
# ============================================================================
{...}: {
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    enableBashIntegration = true;
    settings = builtins.fromTOML (
      builtins.readFile ../../home/.config/starship.toml
    );
  };
}
