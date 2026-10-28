# ============================================================================
# Imports/Variables/State Version
# ============================================================================
{ inputs, ... }: {
  imports = [
    inputs.noctalia.homeModules.default
    # Misc
    ./programs/misc/programs.nix
    # ./programs/misc/ollama.nix
    # ./programs/misc/obs.nix

    # CLI
    ./programs/cli/git.nix
    ./programs/cli/fish.nix
    ./programs/cli/starship.nix
    ./programs/cli/tmux.nix

    # Terminals
    ./programs/terminals/ghostty.nix

    # Editors
    ./programs/editors/vscode.nix
    ./programs/editors/helix.nix
    ./programs/editors/emacs.nix

    # Config
    ./config/default.nix
    ./services/rclone.nix
    ./programs/mime.nix

    # Browsers
    ./programs/browsers/firefox.nix
    ./programs/browsers/qutebrowser.nix
    ./programs/browsers/vivaldi.nix

    # Game Dev
    ./programs/misc/unity_hub.nix

    # Desktop
    ./de/sway/sway.nix
    ./de/hyprland/hyprland.nix
    ./noctalia/noctalia.nix
  ];

  home.stateVersion = "26.11";
}
