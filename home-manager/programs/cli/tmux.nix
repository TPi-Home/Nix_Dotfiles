# ============================================================================
# Tmux
# ============================================================================
{ pkgs, ... }: {
  programs.tmux = {
    enable = true;

    keyMode = "vi";
    mouse = true;
    historyLimit = 50000;

    plugins = with pkgs.tmuxPlugins; [
      vim-tmux-navigator
    ];

    extraConfig = ''
      # ------------------------------------------------------------
      # Pane splitting
      # ------------------------------------------------------------

      # Preserve default session selector (prefix + s)
      bind-key v split-window -h
      bind-key b split-window -v

      # ------------------------------------------------------------
      # Pane navigation
      # ------------------------------------------------------------

      # Prefix + arrow keys
      bind-key Left  select-pane -L
      bind-key Down  select-pane -D
      bind-key Up    select-pane -U
      bind-key Right select-pane -R

      # ------------------------------------------------------------
      # Copy mode (Vi)
      # ------------------------------------------------------------

      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
      bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel
    '';
  };
}