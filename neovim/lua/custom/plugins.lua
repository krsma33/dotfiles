local plugins = {
  {
    -- NvChad terminal disable
    "NvChad/nvterm",
    enabled = false,
  },
  {
    -- LSP
    "neovim/nvim-lspconfig",
    dependencies = "stevearc/conform.nvim",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    -- Rust lsp
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
  {
    -- Rust tools
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    opts = function()
      return require "custom.configs.rust-tools"
    end,
    config = function(_, opts)
      require("rust-tools").setup(opts)
    end,
  },
  {
    -- Debugging
    "mfussenegger/nvim-dap",
    config = function()
      require "custom.configs.nvim-dap"
    end,
    event = "VeryLazy",
  },
  {
    -- Debugging UI
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      require "custom.configs.nvim-dap-ui"
    end,
    event = "VeryLazy",
  },
  {
    -- Rust crates goodies
    "saecki/crates.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    ft = { "rust", "toml" },
    opts = {
      src = {
        cmp = {
          enabled = true,
        },
      },
    },
    config = function(_, opts)
      local crates = require "crates"
      crates.setup(opts)
      crates.show()
    end,
  },
  {
    -- Code completions
    "hrsh7th/nvim-cmp",
    opts = require("custom.configs.cmp").opts,
  },
  {
    -- LSP Server dependencies management
    "williamboman/mason.nvim",
    opts = require("custom.configs.mason").opts,
  },
  {
    -- Just to override and set ensure_installed
    "nvim-treesitter/nvim-treesitter",
    opts = require("custom.configs.treesitter").opts,
  },
  {
    -- File tree
    "nvim-tree/nvim-tree.lua",
    opts = require("custom.configs.nvimtree").opts,
  },
  {
    -- Signature help for multiple overloads
    "Issafalcon/lsp-overloads.nvim",
  },
  {
    -- Code action popup
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup {
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {},
          },
        },
      }
      -- To get ui-select loaded and working with telescope, you need to call
      -- load_extension, somewhere after setup function:
      require("telescope").load_extension "ui-select"
    end,
    event = "VeryLazy",
  },
  {
    -- Code formatter
    "stevearc/conform.nvim",
    opts = require("custom.configs.conform").opts,
    event = "VeryLazy",
  },
  {
    -- Move lines and blocks of code
    "echasnovski/mini.move",
    version = false,
    config = function()
      require("mini.move").setup {
        options = {
          reindent_linewise = true,
        },
      }
    end,
    event = "VeryLazy",
  },
  {
    -- Highlight the word under the cursor
    "echasnovski/mini.cursorword",
    version = false,
    config = function()
      require("mini.cursorword").setup {}
    end,
    event = "BufRead",
  },
  {
    -- Terminal goodies
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = require("custom.configs.toggleterm").opts,
    config = true,
    event = "VeryLazy",
  },
  {
    -- Multiline cursor
    "mg979/vim-visual-multi",
    event = "VeryLazy",
  },
}

return plugins
