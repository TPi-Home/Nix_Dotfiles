# ============================================================================
# Unity Hub
# ============================================================================
{ pkgs, ... }: {
  home.packages = [
    pkgs.unityhub
  ];

  xdg.desktopEntries.unityhub = {
    name = "Unity Hub";
    genericName = "Unity Project Manager";
    comment = "Manage Unity projects and installations";

    icon = "${pkgs.unityhub}/share/icons/hicolor/512x512/apps/unityhub.png";

    terminal = false;

    categories = [
      "Development"
    ];

    mimeType = [
      "x-scheme-handler/unityhub"
    ];
  };
}
