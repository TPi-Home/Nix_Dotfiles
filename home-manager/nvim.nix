{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;

    extraPackages = with pkgs; [
      wl-clipboard
    ];

    plugins = [
      {
        plugin = pkgs.vimPlugins.astrotheme;
        config = ''
          require('astrotheme').setup {
            plugins = {
              ['dashboard-nvim'] = true,
            },
          }

          vim.cmd.colorscheme 'astrodark'
        '';
      }
    ];
  };

  xdg.configFile."nvim/init.lua".source =
    ../home/.config/nvim/init.lua;
}