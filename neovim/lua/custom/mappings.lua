local M = {}

M.general = {

  i = {
    ["<S-Tab>"] = {
      "<cmd>:< <CR>",
      "Unindent"
    },
    ["jk"] = {
      "<ESC>",
      "Escape insert mode",
      opts = { nowait = true }
    },
  }
}

M.lspconfig = {

  n = {
    ["<C-.>"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "LSP code action",
    },
    ["<C-S-Space>"] = {
      function()
        vim.lsp.buf.signature_help()
      end,
      "LSP signature help"
    },
  },

  i = {
    ["<C-Space>"] = {
      function()
        vim.lsp.buf.completion()
      end,
      "LSP completion"
    },
    ["<C-S-Space>"] = {
      function()
        vim.lsp.buf.signature_help()
      end,
      "LSP signature help"
    },
  }
}

M.dap = {

  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Toggle breakpoint"
    },
    ["<leader>dus"] = {
      function()
        local widgets = require('dap.ui.widgets');
        local sidebar = widgets.sidebar(widgets.scopes);
        sidebar.open();
      end,
      "Open debugging sidebar"
    }
  },
}

return M
