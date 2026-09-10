{ pkgs, ... }: {

  # Enable and configure Git
  programs.git = {
    enable = true;
    userName = "TPi-Home";
    userEmail = "45609608+TPi-Home@users.noreply.github.com";

    # Extra configurations for behaviors like default branches or signing
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = true;
      core.editor = "nvim"; 
    };

    # Optional: Global gitignore rules
    ignores = [
      ".DS_Store"
      "*.log"
      ".direnv/"
      "build/"
    ];
  };
}
