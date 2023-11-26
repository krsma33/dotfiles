local M = {}

M.disabled = {
  n = {
    ["<leader>ra"] = "",
    ["<leader>ca"] = "",
    ["<leader>ls"] = "",
    ["Q"] = "",
    ["<A-h>"] = "",
    ["<A-v>"] = "",
    ["<leader>n"] = "",
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
      function()
        require("custom.configs.lazygit").lazygit_toggle()
      end,
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

M.rust = {
  n = {
    ["<leader>rcu"] = {
      function()
        require("crates").upgrade_all_crates()
      end,
      "Update rust crates",
    },
    ["<leader>rr"] = {
      function()
        require("rust-tools").runnables.runnables()
      end,
      "Open Rust run dialog",
    },
    ["<leader>rd"] = {
      function()
        require("rust-tools").debuggables.debuggables()
      end,
      "Open Rust debug dialog",
    },
  },
}

M.dotnet = {
  n = {
    ["<leader>nb"] = {
      '<cmd>TermExec direction="horizontal" cmd="dotnet build"<CR>',
      "Run dotnet build",
    },
    ["<leader>nc"] = {
      '<cmd>TermExec direction="horizontal" cmd="dotnet clean"<CR>',
      "Run dotnet clean",
    },
    ["<leader>nr"] = {
      '<cmd>TermExec direction="horizontal" cmd="dotnet run"<CR>',
      "Run dotnet run",
    },
    ["<leader>nt"] = {
      '<cmd>TermExec direction="horizontal" cmd="dotnet test"<CR>',
      "Run dotnet test",
    },
    ["<leader>np"] = {
      '<cmd>TermExec direction="horizontal" cmd="dotnet publish"<CR>',
      "Run dotnet publish",
    },
  },
}

M.toggleterm = {
  t = {
    -- toggle in terminal mode
    ["<A-i>"] = {
      '<cmd>ToggleTerm direction="float"<CR>',
      "Toggle floating terminal",
    },

    ["<A-H>"] = {
      '<cmd>ToggleTerm direction="horizontal"<CR>',
      "Toggle horizontal terminal",
    },

    ["<A-V>"] = {
      '<cmd>ToggleTerm direction="vertical"<CR>',
      "Toggle vertical terminal",
    },
  },

  n = {
    -- toggle in normal mode
    ["<A-i>"] = {
      '<cmd>ToggleTerm direction="float"<CR>',
      "Toggle floating terminal",
    },

    ["<A-H>"] = {
      '<cmd>ToggleTerm direction="horizontal"<CR>',
      "Toggle horizontal terminal",
    },

    ["<A-V>"] = {
      '<cmd>ToggleTerm direction="vertical"<CR>',
      "Toggle vertical terminal",
    },
  },
}

return M
