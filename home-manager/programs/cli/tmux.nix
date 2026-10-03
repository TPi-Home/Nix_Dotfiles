# ============================================================================
# Tmux
# ============================================================================
{pkgs, ...}: {
  programs.tmux = {
    enable = true;

    # 1. Enforce Vi mode for copy/scroll mode
    keyMode = "vi";

    # 2. Add the vim-tmux-navigator plugin natively
    plugins = with pkgs.tmuxPlugins; [
      vim-tmux-navigator
    ];

    # 3. Custom keybindings for Vim-style pane splitting & selections
    extraConfig = ''
      # Vim-style split shortcuts
      bind-key v split-window -h
      bind-key s split-window -v

      # Vim-style selections in copy-mode-vi
      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
      bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel
    '';
  };
}
