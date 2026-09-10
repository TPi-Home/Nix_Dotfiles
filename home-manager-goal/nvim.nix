# I don't want to keep this lengthy system wide config forever
{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;

    extraPackages = with pkgs; [
      pkg-config
      tree-sitter
      fd
      ripgrep
      git
      lazygit
      wl-clipboard
      
      lua-language-server
      luarocks
      stylua

      gcc
      clang-tools
      cmake
      ninja
      gdb
      lldb

      rustup
      rust-analyzer

      python3
      pyright
      
      nil

      bash-language-server
      yaml-language-server

      marksman
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