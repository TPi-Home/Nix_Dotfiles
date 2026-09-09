{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;

    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;

    setOptions = [
      "CORRECT"
    ];

    interactiveShellInit = ''
      autoload -Uz compinit
      compinit

      source ${pkgs.zsh-fzf-tab}/share/fzf-tab/fzf-tab.plugin.zsh

      zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

      export EDITOR=nvim
      export VISUAL=nvim
    '';
  };
}