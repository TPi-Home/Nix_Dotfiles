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
vim.opt.timeoutlen = 300

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
-- KEYMAPS
-- ============================================================================

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Window navigation.
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", {
  desc = "Move to left window",
})

vim.keymap.set("n", "<C-j>", "<C-w><C-j>", {
  desc = "Move to lower window",
})

vim.keymap.set("n", "<C-k>", "<C-w><C-k>", {
  desc = "Move to upper window",
})

vim.keymap.set("n", "<C-l>", "<C-w><C-l>", {
  desc = "Move to right window",
})

-- Keep standard terminal escape behavior.
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", {
  desc = "Exit terminal mode",
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

vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, {
  desc = "Diagnostics quickfix list",
})

vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, {
  desc = "Show diagnostic",
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
-- THEME
-- ============================================================================

require("astrotheme").setup()

-- ============================================================================
-- WHICH-KEY
-- ============================================================================

require("which-key").setup()

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

vim.keymap.set("n", "]c", function()
  require("gitsigns").next_hunk()
end, {
  desc = "Next git hunk",
})

vim.keymap.set("n", "[c", function()
  require("gitsigns").prev_hunk()
end, {
  desc = "Previous git hunk",
})

vim.keymap.set("n", "<leader>hs", function()
  require("gitsigns").stage_hunk()
end, {
  desc = "Git stage hunk",
})

vim.keymap.set("n", "<leader>hr", function()
  require("gitsigns").reset_hunk()
end, {
  desc = "Git reset hunk",
})

vim.keymap.set("n", "<leader>hS", function()
  require("gitsigns").stage_buffer()
end, {
  desc = "Git stage buffer",
})

vim.keymap.set("n", "<leader>hR", function()
  require("gitsigns").reset_buffer()
end, {
  desc = "Git reset buffer",
})

vim.keymap.set("n", "<leader>hp", function()
  require("gitsigns").preview_hunk()
end, {
  desc = "Git preview hunk",
})

vim.keymap.set("n", "<leader>hb", function()
  require("gitsigns").blame_line({
    full = true,
  })
end, {
  desc = "Git blame line",
})

vim.keymap.set("n", "<leader>hd", function()
  require("gitsigns").diffthis()
end, {
  desc = "Git diff",
})

-- ============================================================================
-- TODO COMMENTS
-- ============================================================================

require("todo-comments").setup()

vim.keymap.set("n", "<leader>ft", function()
  require("telescope.builtin").live_grep({
    default_text = "TODO:",
  })
end, {
  desc = "Find TODO comments",
})

-- ============================================================================
-- MINI
-- ============================================================================

require("mini.icons").setup()
require("mini.ai").setup()
require("mini.surround").setup()

-- ============================================================================
-- NEO-TREE
-- ============================================================================

require("neo-tree").setup({
  close_if_last_window = true,

  filesystem = {
    follow_current_file = {
      enabled = true,
    },

    filtered_items = {
      hide_dotfiles = false,
      hide_gitignored = false,
    },
  },

  window = {
    width = 35,
  },
})

vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<CR>", {
  desc = "Toggle file explorer",
})

vim.keymap.set("n", "<leader>o", "<cmd>Neotree focus<CR>", {
  desc = "Focus file explorer",
})

-- ============================================================================
-- TELESCOPE
-- ============================================================================

local telescope = require("telescope")

telescope.setup({
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown(),
    },
  },
})

pcall(telescope.load_extension, "fzf")
pcall(telescope.load_extension, "ui-select")

local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", builtin.find_files, {
  desc = "Find files",
})

vim.keymap.set("n", "<leader>fg", builtin.live_grep, {
  desc = "Live grep",
})

vim.keymap.set("n", "<leader>fb", builtin.buffers, {
  desc = "Find buffers",
})

vim.keymap.set("n", "<leader>fh", builtin.help_tags, {
  desc = "Find help",
})

vim.keymap.set("n", "<leader>fr", builtin.oldfiles, {
  desc = "Recent files",
})

vim.keymap.set("n", "<leader>fc", builtin.commands, {
  desc = "Find commands",
})

vim.keymap.set("n", "<leader>fd", builtin.diagnostics, {
  desc = "Find diagnostics",
})

vim.keymap.set("n", "<leader>fk", builtin.keymaps, {
  desc = "Find keymaps",
})

vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, {
  desc = "Find document symbols",
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

vim.keymap.set("n", "<leader>cs", "<cmd>AerialToggle!<CR>", {
  desc = "Toggle symbols",
})

-- ============================================================================
-- INDENT BLANKLINE
-- ============================================================================

require("ibl").setup({
  indent = {
    char = "│",
  },

  scope = {
    enabled = true,
  },
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
    local opts = {
      buffer = args.buf,
    }

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)

    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {
      buffer = args.buf,
      desc = "LSP rename",
    })

    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {
      buffer = args.buf,
      desc = "LSP code action",
    })

    vim.keymap.set("n", "<leader>lf", function()
      vim.lsp.buf.format({
        async = true,
      })
    end, {
      buffer = args.buf,
      desc = "LSP format",
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

vim.keymap.set({ "n", "v" }, "<leader>f", function()
  require("conform").format({
    async = true,
    lsp_format = "fallback",
  })
end, {
  desc = "Format buffer",
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

vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<CR>", {
  desc = "Toggle terminal",
})

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", {
  desc = "Exit terminal mode",
})

-- ============================================================================
-- HEIRLINE
-- ============================================================================

local conditions = require("heirline.conditions")
local utils = require("heirline.utils")

local colors = {
  red = "#F8747E",
  orange = "#EB8332",
  yellow = "#D09214",
  green = "#75AD47",
  cyan = "#00B298",
  blue = "#50A4E9",
  purple = "#CC83E3",

  bg = "#1A1D23",
  bg_inactive = "#16181D",
  statusline = "#111317",
  float = "#14161B",
  border = "#3A3E47",
  current_line = "#1E222A",
  selection = "#26343F",

  text = "#9B9FA9",
  text_active = "#ADB0BB",
  text_inactive = "#494D56",
  comment = "#696C76",
  mute = "#595C66",
}

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
    fg = colors.fg,
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
      fg = colors.yellow,
    },
  },

  {
    condition = function()
      return not vim.bo.modifiable or vim.bo.readonly
    end,

    provider = " [RO]",

    hl = {
      fg = colors.red,
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
      fg = colors.purple,
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
      fg = colors.green,
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
      fg = colors.yellow,
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
      fg = colors.red,
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
      fg = colors.red,
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
      fg = colors.yellow,
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
      fg = colors.blue,
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
      fg = colors.cyan,
    },
  },
}

local FileType = {
  provider = function()
    return vim.bo.filetype ~= "" and vim.bo.filetype or "text"
  end,

  hl = {
    fg = colors.blue,
  },
}

local Position = {
  provider = "%l:%c",

  hl = {
    fg = colors.fg,
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
      n = colors.blue,
      i = colors.green,
      v = colors.purple,
      V = colors.purple,
      ["\22"] = colors.purple,
      c = colors.yellow,
      R = colors.red,
      t = colors.cyan,
    },
  },

  provider = function(self)
    return " " .. (self.mode_names[self.mode] or self.mode) .. " "
  end,

  hl = function(self)
    return {
      fg = colors.bg,
      bg = self.mode_colors[self.mode] or colors.blue,
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
    colors = colors,
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

vim.keymap.set("n", "<leader>ss", function()
  require("resession").save()
end, {
  desc = "Save session",
})

vim.keymap.set("n", "<leader>sl", function()
  require("resession").load()
end, {
  desc = "Load session",
})

vim.keymap.set("n", "<leader>sd", function()
  require("resession").delete()
end, {
  desc = "Delete session",
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

vim.keymap.set("n", "<F5>", dap.continue, {
  desc = "Debug continue",
})

vim.keymap.set("n", "<F10>", dap.step_over, {
  desc = "Debug step over",
})

vim.keymap.set("n", "<F11>", dap.step_into, {
  desc = "Debug step into",
})

vim.keymap.set("n", "<F12>", dap.step_out, {
  desc = "Debug step out",
})

vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, {
  desc = "Debug breakpoint",
})

vim.keymap.set("n", "<leader>dB", function()
  dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, {
  desc = "Debug conditional breakpoint",
})

vim.keymap.set("n", "<leader>du", dapui.toggle, {
  desc = "Debug UI",
})

vim.keymap.set("n", "<leader>dr", dap.repl.toggle, {
  desc = "Debug REPL",
})

vim.keymap.set("n", "<leader>dx", dap.terminate, {
  desc = "Debug terminate",
})

-- ============================================================================
-- FINAL SETTINGS
-- ============================================================================

vim.opt.completeopt = {
  "menu",
  "menuone",
  "noselect",
}