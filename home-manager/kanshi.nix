{ ... }:

{
  services.kanshi = {
    enable = true;

    settings = [
      {
        profile = {
          name = "desktop";

          outputs = [
            {
              criteria = "LG Electronics LG ULTRAGEAR 110NTRLAS678";
              mode = "3440x1440@160Hz";
              position = "0,0";
              scale = 1.0;
            }
          ];
        };
      }
    ];
  };
}