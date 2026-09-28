# ============================================================================
# Neovim
# ============================================================================
{
  nix-wrapper-modules,
  pkgs,
  ...
}: {
  imports = [
    (nix-wrapper-modules.lib.getInstallModule {
      name = "neovim";
      value = nix-wrapper-modules.lib.wrapperModules.neovim;
    })
  ];

  wrappers.neovim = {
    enable = true;

    settings = {
      config_directory = ../../home/.config/nvim;
      binName = "nvim";
    };

    specs = {
      # ----------------------------------------------------------------------
      # Theme
      # ----------------------------------------------------------------------

      astrotheme = {
        data = pkgs.vimPlugins.astrotheme;
      };

      # ----------------------------------------------------------------------
      # Core UX
      # ----------------------------------------------------------------------

      guess-indent = pkgs.vimPlugins.guess-indent-nvim;
      gitsigns = pkgs.vimPlugins.gitsigns-nvim;
      which-key = pkgs.vimPlugins.which-key-nvim;
      todo-comments = pkgs.vimPlugins.todo-comments-nvim;
      snacks = pkgs.vimPlugins.snacks-nvim;

      mini = pkgs.vimPlugins.mini-nvim;

      # ----------------------------------------------------------------------
      # Telescope
      # ----------------------------------------------------------------------

      telescope = {
        data = [
          pkgs.vimPlugins.telescope-nvim
          pkgs.vimPlugins.plenary-nvim
          pkgs.vimPlugins.telescope-fzf-native-nvim
          pkgs.vimPlugins.telescope-ui-select-nvim
        ];
      };

      # ----------------------------------------------------------------------
      # File Explorer
      # ----------------------------------------------------------------------

      neo-tree = {
        data = [
          pkgs.vimPlugins.neo-tree-nvim
          pkgs.vimPlugins.nvim-window-picker
          pkgs.vimPlugins.nui-nvim
          pkgs.vimPlugins.plenary-nvim
          pkgs.vimPlugins.nvim-web-devicons
        ];
      };

      # ----------------------------------------------------------------------
      # UI
      # ----------------------------------------------------------------------

      astrocore = pkgs.vimPlugins.astrocore;
      astroui = pkgs.vimPlugins.astroui;
      aerial = pkgs.vimPlugins.aerial-nvim;
      indent-blankline = pkgs.vimPlugins.indent-blankline-nvim;

      # ----------------------------------------------------------------------
      # Treesitter
      # ----------------------------------------------------------------------

      treesitter = [
        pkgs.vimPlugins.nvim-treesitter
        pkgs.vimPlugins.nvim-treesitter-textobjects
      ];

      # ----------------------------------------------------------------------
      # Completion
      # ----------------------------------------------------------------------

      blink = pkgs.vimPlugins.blink-cmp;
      luasnip = pkgs.vimPlugins.luasnip;
      friendly-snippets = pkgs.vimPlugins.friendly-snippets;

      # ----------------------------------------------------------------------
      # LSP
      # ----------------------------------------------------------------------

      lspconfig = pkgs.vimPlugins.nvim-lspconfig;
      fidget = pkgs.vimPlugins.fidget-nvim;

      # ----------------------------------------------------------------------
      # Formatting
      # ----------------------------------------------------------------------

      conform = pkgs.vimPlugins.conform-nvim;

      # ----------------------------------------------------------------------
      # Editing
      # ----------------------------------------------------------------------

      autopairs = pkgs.vimPlugins.nvim-autopairs;
      ts-autotag = pkgs.vimPlugins.nvim-ts-autotag;

      # ----------------------------------------------------------------------
      # Terminal
      # ----------------------------------------------------------------------

      toggleterm = pkgs.vimPlugins.toggleterm-nvim;

      # ----------------------------------------------------------------------
      # Statusline
      # ----------------------------------------------------------------------

      heirline = pkgs.vimPlugins.heirline-nvim;

      # ----------------------------------------------------------------------
      # Sessions
      # ----------------------------------------------------------------------

      resession = pkgs.vimPlugins.resession-nvim;

      # ----------------------------------------------------------------------
      # Debugging
      # ----------------------------------------------------------------------

      dap = [
        pkgs.vimPlugins.nvim-dap
        pkgs.vimPlugins.nvim-dap-ui
        pkgs.vimPlugins.nvim-nio
      ];
    };
  };
}
