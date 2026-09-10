{ ... }:

{
  programs.starship = {
    enable = true;

    settings = builtins.fromTOML (
      builtins.readFile ../home/.config/starship.toml
    );
  };
}