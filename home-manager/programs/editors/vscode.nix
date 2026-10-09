# ============================================================================
# VSCode
# ============================================================================
{pkgs, ...}: {
  programs.vscode = {
    enable = true;

    profiles.default.extensions = with pkgs.vscode-extensions; [
      # --------------------------------------------------------------------------
      # IDE Niceties
      # --------------------------------------------------------------------------

      # Theme
      zhuangtongfa.material-theme

      # Icons
      pkief.material-icon-theme

      # Misc
      streetsidesoftware.code-spell-checker
      naumovs.color-highlight

      # --------------------------------------------------------------------------
      # C / C++
      # --------------------------------------------------------------------------

      ms-vscode.cpptools-extension-pack

      # --------------------------------------------------------------------------
      # Python
      # --------------------------------------------------------------------------

      ms-python.python

      # --------------------------------------------------------------------------
      # Nix
      # --------------------------------------------------------------------------

      jnoortheen.nix-ide
    ];
  };

  xdg.configFile = {
    "Code/User/settings.json".source =
      ../../../home/.config/Code/User/settings.json;

    "Code/User/keybindings.json".source =
      ../../../home/.config/Code/User/keybindings.json;

    "Code/User/tasks.json".source =
      ../../../home/.config/Code/User/tasks.json;
  };
}
