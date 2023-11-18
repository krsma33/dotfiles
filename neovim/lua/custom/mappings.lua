local M = {}

M.disabled = {
  n = {
    ["<leader>ra"] = "",
    ["<leader>ca"] = "",
    ["<leader>ls"] = "",
  },

  v = {
    ["<leader>ca"] = "",
  },
}

M.general = {
  n = {
    ["U"] = { "<C-r>", "Undo" },
    ["<leader>gg"] = {
      ":LazyGit<CR>",
      "Open Lazygit",
    },
  },

  i = {
    ["<S-Tab>"] = {
      "<BS>",
      "Backspace",
    },
    ["jk"] = {
      "<ESC>",
      "Escape insert mode",
      opts = { nowait = true },
    },
  },

  v = {
    ["jk"] = {
      "<ESC>",
      "Escape insert mode",
      opts = { nowait = true },
    },
  },
}

M.lspconfig = {
  plugin = true,

  n = {
    ["<C-.>"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "LSP code action",
    },
    ["<C-Space>"] = {
      function()
        vim.lsp.buf.hover()
      end,
      "LSP hover",
    },
    ["<C-S-Space>"] = {
      function()
        vim.lsp.buf.signature_help()
      end,
      "LSP signature help",
    },
    ["<C-r><C-r>"] = {
      function()
        require("nvchad.renamer").open()
      end,
      "LSP rename",
    },
  },

  i = {
    ["<C-Space>"] = {
      function()
        vim.lsp.buf.completion()
      end,
      "LSP completion",
    },
    ["<C-S-Space>"] = {
      function()
        vim.lsp.buf.signature_help()
      end,
      "LSP signature help",
    },
  },

  v = {
    ["<C-.>"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "LSP code action",
    },
  },
}

M.dap = {

  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Toggle breakpoint",
    },
    ["<leader>dus"] = {
      function()
        local widgets = require "dap.ui.widgets"
        local sidebar = widgets.sidebar(widgets.scopes)
        sidebar.open()
      end,
      "Open debugging sidebar",
    },
    ["<F5>"] = {
      function()
        require("dap").continue()
      end,
      "start/continue to next breakpoint",
    },
    ["<F10>"] = {
      function()
        require("dap").step_over()
      end,
      "step over next line",
    },
    ["<F11>"] = {
      function()
        require("dap").step_into()
      end,
      "step into method",
    },
    ["<F12>"] = {
      function()
        require("dap").step_out()
      end,
      "step out of method",
    },
  },
}

return M
