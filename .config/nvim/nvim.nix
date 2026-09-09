{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;

    extraPackages = with pkgs; [
      lua-language-server
      stylua

      # Add more language tools here later:
      # clang-tools
      # rust-analyzer
      # pyright
      # nil
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

    extraLuaConfig = builtins.readFile ./nvim/init.lua;
  };
}