{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "tyler";
        email = "45609608+TPi-Home@users.noreply.github.com";
      };

      init.defaultBranch = "main";
      pull.rebase = true;
      core.editor = "nvim";
    };

    ignores = [
      ".DS_Store"
      "*.log"
      ".direnv/"
      "build/"
    ];
  };
}