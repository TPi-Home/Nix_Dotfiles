{ pkgs, ... }:

let
  unityhub-scaled = pkgs.symlinkJoin {
    name = "unityhub-scaled";
    paths = [ pkgs.unityhub ];

    nativeBuildInputs = [ pkgs.makeWrapper ];

    postBuild = ''
      wrapProgram $out/opt/unityhub/unityhub \
        --add-flags "--force-device-scale-factor=1.5"
    '';
  };
in
{
  home.packages = [
    unityhub-scaled
  ];
}