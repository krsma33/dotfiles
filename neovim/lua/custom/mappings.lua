local M = {}

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
  }
}

M.lspconfig = {

  -- Map µ as code action (which we bound in Alacritty to be sent via CTRL+.) --
  n = {
    ["<Char-0xb5>"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "LSP code action",
    },
  -- Map ALT+Enter as code action -- 
    ["<M-.>"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "LSP code action",
    },
  },

  -- Map µ as code action (which we bound in Alacritty to be sent via CTRL+.) --
  i = {
    ["<Char-0xb5>"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "LSP code action",
    },

  }
}

return M
