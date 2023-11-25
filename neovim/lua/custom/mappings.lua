local M = {}

M.disabled = {
  n = {
    ["<leader>ra"] = "",
    ["<leader>ca"] = "",
    ["<leader>ls"] = "",
    ["Q"] = "",
    ["<A-h>"] = "",
    ["<A-v>"] = "",
  },

  v = {
    ["<leader>ca"] = "",
  },

  t = {
    ["<A-h>"] = "",
    ["<A-v>"] = "",
  },
}

M.general = {
  n = {
    ["U"] = { "<C-r>", "Undo" },
    ["<C-d>"] = { "<C-d>zz" },
    ["<C-u>"] = { "<C-u>zz" },
    ["n"] = { "nzzzv" },
    ["N"] = { "Nzzzv" },
    ["<leader>gg"] = {
      ":LazyGit<CR>",
      "Open Lazygit",
    },
    ["<C-/>"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "Toggle comment",
    },
  },

  v = {
    ["<C-/>"] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "Toggle comment",
    },
  },

  i = {
    ["<S-Tab>"] = {
      "<BS>",
      "Backspace",
    },
    ["jk"] = {
      "<ESC>",
      "Exit insert mode",
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
    ["<leader>du"] = {
      function()
        require("dapui").toggle { reset = true }
      end,
      "Open debugging ui",
    },
    ["<leader>dr"] = {
      function()
        require("rust-tools").debuggables.debuggables()
      end,
      "Open Rust debugging dialog",
    },
    ["<leader>db"] = {
      "<cmd>DapToggleBreakpoint<CR>",
      "Debug: Toggle breakpoint",
    },
    ["<F5>"] = {
      function()
        require("dap").continue()
      end,
      "Debug: Run/Continue",
    },
    ["<F6>"] = {
      function()
        require("dap").step_over()
      end,
      "Debug: Step over",
    },
    ["<F7>"] = {
      function()
        require("dap").step_into()
      end,
      "Debug: Step into",
    },
    ["<F8>"] = {
      function()
        require("dap").step_out()
      end,
      "Debug: Step outd",
    },
    ["<F9>"] = {
      function()
        require("dap").terminate()
        require("dapui").close()
      end,
      "Debug: Terminate",
    },
  },
}

M.crates = {
  n = {
    ["<leader>rcu"] = {
      function()
        require("crates").upgrade_all_crates()
      end,
      "Update rust crates",
    },
  },
}

M.nvterm = {
  plugin = true,

  t = {
    -- toggle in terminal mode
    ["<A-H>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "Toggle horizontal term",
    },

    ["<A-V>"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "Toggle vertical term",
    },
  },

  n = {
    -- toggle in normal mode
    ["<A-H>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "Toggle horizontal term",
    },

    ["<A-V>"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "Toggle vertical term",
    },
  },
}

return M
