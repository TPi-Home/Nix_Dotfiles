# ============================================================================
# Tyler
# ============================================================================

{pkgs, ...}:

{
  programs.fish.enable = true;
  users.users.tyler = {
    isNormalUser = true;
    description = "tyler";
    shell = pkgs.fish;

    extraGroups = [
      "wheel"
      "networkmanager"
      "video"
      "audio"
      "power"
    ];
  };
}