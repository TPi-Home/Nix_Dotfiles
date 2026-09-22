# ============================================================================
# Unity Hub
# ============================================================================

{ pkgs, ... }:

{
  home.packages = 
  [
    pkgs.unityhub
  ];

  xdg.desktopEntries.unityhub = 
  {
    name = "Unity Hub";
    genericName = "Unity Project Manager";
    comment = "Manage Unity projects and installations";

    exec = "${pkgs.unityhub}/opt/unityhub/unityhub --force-device-scale-factor=1.5 %U";

    icon = "${pkgs.unityhub}/share/icons/hicolor/512x512/apps/unityhub.png";

    terminal = false;

    categories = 
    [
      "Development"
    ];

    mimeType = 
    [
      "x-scheme-handler/unityhub"
    ];
  };
}