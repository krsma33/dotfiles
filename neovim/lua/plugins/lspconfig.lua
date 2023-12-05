return {
  "neovim/nvim-lspconfig",
  init = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()

    -- Disable Default Keys
    keys[#keys + 1] = { "<C-k>", false, mode = "i" }

    -- Code action
    keys[#keys + 1] = {
      "<C-.>",
      vim.lsp.buf.code_action,
      desc = "Code Action",
      mode = { "n", "v" },
      has = "codeAction",
    }

    -- Source code action
    keys[#keys + 1] = {
      "<C-S-.>",
      function()
        vim.lsp.buf.code_action({
          context = {
            only = {
              "source",
            },
            diagnostics = {},
          },
        })
      end,
      desc = "Source Action",
      has = "codeAction",
    }

    -- Go to implementation
    keys[#keys + 1] = {
      "gi",
      function()
        require("telescope.builtin").lsp_implementations({ reuse_win = true })
      end,
      desc = "Goto Implementation",
    }

    -- LSP rename
    keys[#keys + 1] = {
      "<C-r><C-r>",
      function()
        vim.lsp.buf.rename()
      end,
      desc = "Rename",
      mode = { "n", "v" },
    }

    -- Signature help
    keys[#keys + 1] = {
      "<C-S-Space>",
      function()
        vim.lsp.buf.signature_help()
      end,
      desc = "Signature Help",
      mode = { "n", "i" },
      has = "signatureHelp",
    }
  end,
  opts = {
    servers = {
      omnisharp = require("plugins.lsp.omnisharp"),
    },
  },
}
