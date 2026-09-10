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

    extraLuaConfig = builtins.readFile ../home/.config/nvim/init.lua;
  };
}