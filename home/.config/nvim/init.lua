-- ============================================================================
-- Neovim
-- Standard Neovim configuration with AstroDark and plugin integrations.
-- Plugins are provided by Nix.
-- ============================================================================

-- ============================================================================
-- OPTIONS
-- ============================================================================

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.showmode = false

vim.opt.breakindent = true
vim.opt.undofile = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.timeoutlen = 10000

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.list = true
vim.opt.listchars = {
  tab = "» ",
  trail = "·",
  nbsp = "␣",
}

vim.opt.inccommand = "split"
vim.opt.cursorline = true
vim.opt.scrolloff = 8
vim.opt.confirm = true

vim.opt.termguicolors = true

-- ============================================================================
-- WHICH-KEY
-- ============================================================================
-- Set up early so every plugin section below can register its own group and
-- keymaps together via wk.add, right next to the plugin it belongs to.

local wk = require("which-key")

wk.setup()

-- ============================================================================
-- KEYMAPS
-- ============================================================================

wk.add({
  { "<Esc>", "<cmd>nohlsearch<CR>", desc = "Clear search highlight" },
  { "<C-h>", "<C-w><C-h>", desc = "Move to left window" },
  { "<C-j>", "<C-w><C-j>", desc = "Move to lower window" },
  { "<C-k>", "<C-w><C-k>", desc = "Move to upper window" },
  { "<C-l>", "<C-w><C-l>", desc = "Move to right window" },
  { "<Esc><Esc>", "<C-\\><C-n>", mode = "t", desc = "Exit terminal mode" },
})

-- ============================================================================
-- DIAGNOSTICS
-- ============================================================================

vim.diagnostic.config({
  severity_sort = true,

  float = {
    border = "rounded",
    source = "if_many",
  },

  underline = {
    severity = {
      min = vim.diagnostic.severity.WARN,
    },
  },

  virtual_text = true,
})

wk.add({
  { "<leader>q", group = "diagnostics", icon = "󰒡" },
  { "<leader>qq", vim.diagnostic.setloclist, desc = "Diagnostics to location list" },
  { "<leader>qd", vim.diagnostic.open_float, desc = "Show diagnostic (cursor)" },
})

-- ============================================================================
-- AUTOCMDS
-- ============================================================================

local augroup = vim.api.nvim_create_augroup("user-config", {
  clear = true,
})

vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup,

  callback = function()
    vim.hl.on_yank()
  end,
})

vim.api.nvim_create_autocmd("VimResized", {
  group = augroup,

  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})

-- ============================================================================
-- ASTROTHEME
-- ============================================================================

require("astrotheme").setup({
  palette = "astrodark",

  background = {
    light = "astrolight",
    dark = "astrodark",
  },

  style = {
    transparent = false,
    inactive = true,
    float = true,
    border = true,
    title_invert = true,
    italic_comments = true,
    simple_syntax_colors = true,
  },

  termguicolors = true,
  terminal_colors = true,

  -- We manage plugins with Nix rather than lazy.nvim/packer.
  -- Explicitly enable AstroTheme's integrations for the plugins we use.
  plugin_default = false,

  plugins = {
    ["aerial.nvim"] = true,
    ["blink.cmp"] = true,
    ["gitsigns.nvim"] = true,

    ["mini.nvim"] = true,
    ["mini.icons"] = true,

    ["nvim-dap-ui"] = true,
    ["nvim-web-devicons"] = true,
    ["nvim-window-picker"] = true,

    ["snacks.nvim"] = true,

    ["todo-comments.nvim"] = true,
    ["which-key.nvim"] = true,
  },

  highlights = {
    global = {},
    astrodark = {},
  },
})

vim.cmd.colorscheme("astrodark")

-- ============================================================================
-- GUESS INDENT
-- ============================================================================

require("guess-indent").setup()

-- ============================================================================
-- GITSIGNS
-- ============================================================================

require("gitsigns").setup({
  signs = {
    add = {
      text = "+",
    },

    change = {
      text = "~",
    },

    delete = {
      text = "_",
    },

    topdelete = {
      text = "‾",
    },

    changedelete = {
      text = "~",
    },
  },
})

wk.add({
  { "]c", function() require("gitsigns").next_hunk() end, desc = "Next git hunk" },
  { "[c", function() require("gitsigns").prev_hunk() end, desc = "Previous git hunk" },

  { "<leader>h", group = "git", icon = "󰊢" },
  { "<leader>hs", function() require("gitsigns").stage_hunk() end, desc = "Stage hunk" },
  { "<leader>hr", function() require("gitsigns").reset_hunk() end, desc = "Reset hunk" },
  { "<leader>hS", function() require("gitsigns").stage_buffer() end, desc = "Stage buffer" },
  { "<leader>hR", function() require("gitsigns").reset_buffer() end, desc = "Reset buffer" },
  { "<leader>hp", function() require("gitsigns").preview_hunk() end, desc = "Preview hunk" },
  { "<leader>hb", function() require("gitsigns").blame_line({ full = true }) end, desc = "Blame line" },
  { "<leader>hd", function() require("gitsigns").diffthis() end, desc = "Diff this" },
})

-- ============================================================================
-- TODO COMMENTS
-- ============================================================================

require("todo-comments").setup()

-- ============================================================================
-- MINI
-- ============================================================================

require("mini.icons").setup()
require("mini.ai").setup()
require("mini.surround").setup()

-- ============================================================================
-- SNACKS
-- ============================================================================

local Snacks = require("snacks")

Snacks.setup({
  bigfile = {
    enabled = true,
  },

  indent = {
    enabled = true,
    char = "│",
    only_scope = false,
    only_current = false,
  },

  input = {
    enabled = true,
  },

  notifier = {
    enabled = true,
    timeout = 3000,
  },

  quickfile = {
    enabled = true,
  },

  scope = {
    enabled = true,
  },

  words = {
    enabled = true,
  },
})

-- ============================================================================
-- TELESCOPE
-- ============================================================================

local telescope = require("telescope")
local builtin = require("telescope.builtin")

telescope.setup({
  defaults = {
    layout_strategy = "horizontal",
    sorting_strategy = "ascending",

    layout_config = {
      prompt_position = "top",
    },
  },
})

pcall(telescope.load_extension, "fzf")
pcall(telescope.load_extension, "ui-select")

wk.add({
  { "<leader>f", group = "find", icon = "󰍉" },

  { "<leader><space>", builtin.find_files, desc = "Find files" },
  { "<leader>ff", builtin.find_files, desc = "Find files" },
  { "<leader>fg", builtin.live_grep, desc = "Grep" },
  { "<leader>fb", builtin.buffers, desc = "Buffers" },
  { "<leader>fr", builtin.oldfiles, desc = "Recent files" },
  { "<leader>fh", builtin.help_tags, desc = "Help" },
  { "<leader>fc", builtin.commands, desc = "Commands" },
  { "<leader>fd", builtin.diagnostics, desc = "Diagnostics" },
  { "<leader>fk", builtin.keymaps, desc = "Keymaps" },
  { "<leader>fs", builtin.lsp_document_symbols, desc = "LSP symbols" },
})

-- ============================================================================
-- NEO-TREE
-- ============================================================================

require("neo-tree").setup({
  close_if_last_window = true,

  filesystem = {
    filtered_items = {
      visible = true,
      hide_dotfiles = false,
      hide_gitignored = false,
    },
  },

  window = {
    width = 35,
  },
})

wk.add({
  {
    "<leader>e",
    "<cmd>Neotree toggle<CR>",
    desc = "Explorer",
    icon = "󰙅",
  },
})

-- ============================================================================
-- AERIAL
-- ============================================================================

require("aerial").setup({
  backends = {
    "lsp",
    "treesitter",
    "markdown",
    "man",
  },
})

wk.add({
  { "<leader>c", group = "code", icon = "󰅩" },
  { "<leader>cs", "<cmd>AerialToggle!<CR>", desc = "Toggle symbols" },
})

-- ============================================================================
-- TREESITTER
-- ============================================================================

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("treesitter-config", {
    clear = true,
  }),

  callback = function(args)
    local language = vim.treesitter.language.get_lang(args.match)

    if not language then
      return
    end

    pcall(vim.treesitter.start, args.buf, language)
  end,
})

-- ============================================================================
-- LSP
-- ============================================================================

require("fidget").setup()

local servers = {
  clangd = {},
  rust_analyzer = {},
  lua_ls = {},
  taplo = {},
  jsonls = {},
  nixd = {},
}

for name, config in pairs(servers) do
  vim.lsp.config(name, config)
  vim.lsp.enable(name)
end

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp-config", {
    clear = true,
  }),

  callback = function(args)
    wk.add({
      { "gd", vim.lsp.buf.definition, desc = "Goto definition", buffer = args.buf },
      { "gD", vim.lsp.buf.declaration, desc = "Goto declaration", buffer = args.buf },
      { "gr", vim.lsp.buf.references, desc = "Goto references", buffer = args.buf },
      { "gi", vim.lsp.buf.implementation, desc = "Goto implementation", buffer = args.buf },
      { "K", vim.lsp.buf.hover, desc = "Hover documentation", buffer = args.buf },
      { "<leader>cr", vim.lsp.buf.rename, desc = "Rename symbol", buffer = args.buf },
      { "<leader>ca", vim.lsp.buf.code_action, desc = "Code action", buffer = args.buf },
    })
  end,
})

-- ============================================================================
-- CONFORM
-- ============================================================================

require("conform").setup({
  notify_on_error = false,

  format_on_save = {
    timeout_ms = 500,
    lsp_format = "fallback",
  },

  formatters_by_ft = {
    c = {
      "clang_format",
    },

    cpp = {
      "clang_format",
    },

    rust = {
      "rustfmt",
    },

    lua = {
      "stylua",
    },

    toml = {
      "taplo",
    },

    json = {
      "prettier",
    },

    jsonc = {
      "prettier",
    },

    nix = {
      "nixfmt",
    },
  },
})

wk.add({
  {
    "<leader>cf",
    function()
      require("conform").format({
        async = true,
        lsp_format = "fallback",
      })
    end,
    mode = { "n", "v" },
    desc = "Format buffer",
  },
})

-- ============================================================================
-- COMPLETION
-- ============================================================================

require("luasnip").setup()

require("blink.cmp").setup({
  keymap = {
    preset = "default",
  },

  completion = {
    documentation = {
      auto_show = false,
    },
  },

  sources = {
    default = {
      "lsp",
      "path",
      "snippets",
    },
  },

  snippets = {
    preset = "luasnip",
  },

  signature = {
    enabled = true,
  },
})

-- ============================================================================
-- AUTOPAIRS / AUTOTAG
-- ============================================================================

require("nvim-autopairs").setup()

require("nvim-ts-autotag").setup()

-- ============================================================================
-- TOGGLETERM
-- ============================================================================

require("toggleterm").setup({
  direction = "float",
  float_opts = {
    border = "single",
  },
})

wk.add({
  { "<leader>t", group = "terminal", icon = "" },
  { "<leader>tt", "<cmd>ToggleTerm<CR>", desc = "Toggle terminal" },
})

-- ============================================================================
-- HEIRLINE
-- ============================================================================

local conditions = require("heirline.conditions")
local c = require("astrotheme.palettes.astrodark")

local Align = {
  provider = "%=",
}

local Space = {
  provider = " ",
}

local FileName = {
  init = function(self)
    self.filename = vim.api.nvim_buf_get_name(0)
  end,

  provider = function(self)
    local filename = vim.fn.fnamemodify(self.filename, ":t")

    if filename == "" then
      return "[No Name]"
    end

    return filename
  end,

  hl = {
    fg = c.ui.text_active,
    bold = true,
  },
}

local FileFlags = {
  {
    condition = function()
      return vim.bo.modified
    end,

    provider = " [+]",

    hl = {
      fg = c.ui.yellow,
    },
  },

  {
    condition = function()
      return not vim.bo.modifiable or vim.bo.readonly
    end,

    provider = " [RO]",

    hl = {
      fg = c.ui.red,
    },
  },
}

local Git = {
  condition = conditions.is_git_repo,

  init = function(self)
    self.status_dict = vim.b.gitsigns_status_dict
  end,

  {
    provider = function(self)
      if not self.status_dict or not self.status_dict.head then
        return ""
      end

      return " " .. self.status_dict.head
    end,

    hl = {
      fg = c.ui.purple,
    },
  },

  {
    condition = function(self)
      return self.status_dict and self.status_dict.added
    end,

    provider = function(self)
      return " +" .. self.status_dict.added
    end,

    hl = {
      fg = c.ui.green,
    },
  },

  {
    condition = function(self)
      return self.status_dict and self.status_dict.changed
    end,

    provider = function(self)
      return " ~" .. self.status_dict.changed
    end,

    hl = {
      fg = c.ui.yellow,
    },
  },

  {
    condition = function(self)
      return self.status_dict and self.status_dict.removed
    end,

    provider = function(self)
      return " -" .. self.status_dict.removed
    end,

    hl = {
      fg = c.ui.red,
    },
  },
}

local Diagnostics = {
  condition = conditions.has_diagnostics,

  init = function(self)
    self.errors = #vim.diagnostic.get(0, {
      severity = vim.diagnostic.severity.ERROR,
    })

    self.warnings = #vim.diagnostic.get(0, {
      severity = vim.diagnostic.severity.WARN,
    })

    self.info = #vim.diagnostic.get(0, {
      severity = vim.diagnostic.severity.INFO,
    })

    self.hints = #vim.diagnostic.get(0, {
      severity = vim.diagnostic.severity.HINT,
    })
  end,

  {
    condition = function(self)
      return self.errors > 0
    end,

    provider = function(self)
      return "  " .. self.errors
    end,

    hl = {
      fg = c.ui.red,
    },
  },

  {
    condition = function(self)
      return self.warnings > 0
    end,

    provider = function(self)
      return "  " .. self.warnings
    end,

    hl = {
      fg = c.ui.yellow,
    },
  },

  {
    condition = function(self)
      return self.info > 0
    end,

    provider = function(self)
      return "  " .. self.info
    end,

    hl = {
      fg = c.ui.blue,
    },
  },

  {
    condition = function(self)
      return self.hints > 0
    end,

    provider = function(self)
      return "  " .. self.hints
    end,

    hl = {
      fg = c.ui.cyan,
    },
  },
}

local FileType = {
  provider = function()
    return vim.bo.filetype ~= "" and vim.bo.filetype or "text"
  end,

  hl = {
    fg = c.ui.blue,
  },
}

local Position = {
  provider = "%l:%c",

  hl = {
    fg = c.ui.text_active,
    bold = true,
  },
}

local Mode = {
  init = function(self)
    self.mode = vim.fn.mode()
  end,

  static = {
    mode_names = {
      n = "NORMAL",
      no = "NORMAL",
      i = "INSERT",
      ic = "INSERT",
      v = "VISUAL",
      V = "V-LINE",
      ["\22"] = "V-BLOCK",
      c = "COMMAND",
      R = "REPLACE",
      t = "TERMINAL",
    },

    mode_colors = {
      n = c.ui.blue,
      i = c.ui.green,
      v = c.ui.purple,
      V = c.ui.purple,
      ["\22"] = c.ui.purple,
      c = c.ui.yellow,
      R = c.ui.red,
      t = c.ui.cyan,
    },
  },

  provider = function(self)
    return " " .. (self.mode_names[self.mode] or self.mode) .. " "
  end,

  hl = function(self)
    return {
      fg = c.ui.base,
      bg = self.mode_colors[self.mode] or c.ui.blue,
      bold = true,
    }
  end,
}

require("heirline").setup({
  statusline = {
    Mode,
    Space,
    FileName,
    FileFlags,
    Space,
    Git,
    Align,
    Diagnostics,
    Space,
    FileType,
    Space,
    Position,
    Space,
  },

  opts = {
    colors = c.ui,

    disable_winbar_cb = function(args)
      return conditions.buffer_matches({
        buftype = {
          "nofile",
          "prompt",
          "help",
          "quickfix",
        },
      }, args.buf)
    end,
  },
})

-- ============================================================================
-- RESESSION
-- ============================================================================

require("resession").setup({
  autosave = {
    enabled = true,
    interval = 60,
    notify = false,
  },
})

wk.add({
  { "<leader>s", group = "session", icon = "󰆓" },
  { "<leader>ss", function() require("resession").save() end, desc = "Save session" },
  { "<leader>sl", function() require("resession").load() end, desc = "Load session" },
  { "<leader>sd", function() require("resession").delete() end, desc = "Delete session" },
})

-- ============================================================================
-- DAP
-- ============================================================================

local dap = require("dap")
local dapui = require("dapui")

dapui.setup()

dap.listeners.after.event_initialized["dapui"] = function()
  dapui.open()
end

dap.listeners.before.event_terminated["dapui"] = function()
  dapui.close()
end

dap.listeners.before.event_exited["dapui"] = function()
  dapui.close()
end

wk.add({
  { "<F5>", dap.continue, desc = "Debug continue" },
  { "<F10>", dap.step_over, desc = "Debug step over" },
  { "<F11>", dap.step_into, desc = "Debug step into" },
  { "<F12>", dap.step_out, desc = "Debug step out" },

  { "<leader>d", group = "debug", icon = "" },
  { "<leader>db", dap.toggle_breakpoint, desc = "Toggle breakpoint" },
  {
    "<leader>dB",
    function() dap.set_breakpoint(vim.fn.input("Breakpoint condition: ")) end,
    desc = "Conditional breakpoint",
  },
  { "<leader>du", dapui.toggle, desc = "Toggle debug UI" },
  { "<leader>dr", dap.repl.toggle, desc = "Toggle REPL" },
  { "<leader>dx", dap.terminate, desc = "Terminate" },
})

-- ============================================================================
-- FINAL SETTINGS
-- ============================================================================

vim.opt.completeopt = {
  "menu",
  "menuone",
  "noselect",
}