return {
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      style = "storm",
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
  {
    "catppuccin",
    opts = {
      transparent_background = true,
    },
  },
  {
    "daschw/leaf.nvim",
    opts = {
      transparent = true,
      contrast = "low",
      overrides = {
        NormalFloat = { bg = "none" },
        FloatBorder = { bg = "none", fg = "#5292c6" },
        Comment = { fg = "#5a5859" },
        CursorLine = { bg = "#20272c" },
        TelescopeSelection = { link = "CursorLine" },
        Separator = { bg = "none" },
        TabLineFill = { bg = "none" },
        ColorColumn = { bg = "#151a1e", fg = "#729b79" },
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "leaf",
      icons = {
        misc = {
          dots = "󰇘",
        },
        dap = {
          Stopped = { "󰁕 ", "DiagnosticWarn", "DapStoppedLine" },
          Breakpoint = " ",
          BreakpointCondition = " ",
          BreakpointRejected = { " ", "DiagnosticError" },
          LogPoint = ".>",
        },
        diagnostics = {
          Error = " ",
          Warn = " ",
          Hint = " ",
          Info = " ",
        },
        git = {
          added = " ",
          modified = " ",
          removed = " ",
        },
        kinds = {
          Array = " ",
          Boolean = "󰨙 ",
          Class = "󰠱 ",
          Codeium = "󰘦 ",
          Color = "󰏘 ",
          Control = " ",
          Collapsed = " ",
          Constant = "󰏿 ",
          Constructor = " ",
          Copilot = " ",
          Enum = " ",
          EnumMember = " ",
          Event = " ",
          Field = " ",
          File = "󰈙 ",
          Folder = "󰉋 ",
          Function = "󰊕 ",
          Interface = " ",
          Key = " ",
          Keyword = "󰌋 ",
          Method = "󰆧 ",
          Module = " ",
          Namespace = "󰦮 ",
          Null = " ",
          Number = "󰎠 ",
          Object = " ",
          Operator = "󰆕 ",
          Package = " ",
          Property = " ",
          Reference = " ",
          Snippet = " ",
          String = " ",
          Struct = " ",
          TabNine = "󰏚 ",
          Text = " ",
          TypeParameter = "󰅲 ",
          Unit = " ",
          Value = "󰎠 ",
          Variable = "󰫧 ",
        },
      },
    },
  },
  {
    "folke/edgy.nvim",
    event = "VeryLazy",
    keys = {
      {
        "<C-S-b>",
        function()
          require("edgy").select()
        end,
        desc = "Edgy Select Window",
      },
    },
    opts = function()
      local opts = {
        bottom = {
          {
            ft = "toggleterm",
            size = { height = 0.3 },
            filter = function(buf, win)
              return vim.api.nvim_win_get_config(win).relative == ""
            end,
          },
          {
            ft = "noice",
            size = { height = 0.3 },
            filter = function(buf, win)
              return vim.api.nvim_win_get_config(win).relative == ""
            end,
          },
          {
            ft = "lazyterm",
            title = "Terminal",
            size = { height = 0.3 },
            filter = function(buf)
              return not vim.b[buf].lazyterm_cmd
            end,
          },
          "Trouble",
          {
            ft = "trouble",
            filter = function(buf, win)
              return vim.api.nvim_win_get_config(win).relative == ""
            end,
          },
          { ft = "qf", title = "QuickFix" },
          {
            ft = "help",
            size = { height = 20 },
            -- don't open help files in edgy that we're editing
            filter = function(buf)
              return vim.bo[buf].buftype == "help"
            end,
          },
          { title = "Spectre", ft = "spectre_panel", size = { height = 0.3 } },
          { title = "Neotest Output", ft = "neotest-output-panel", size = { height = 15 } },
        },
        left = {
          {
            title = "Neo-Tree",
            ft = "neo-tree",
            filter = function(buf)
              return vim.b[buf].neo_tree_source == "filesystem"
            end,
            pinned = true,
            open = function()
              vim.api.nvim_input("<esc><space>e")
            end,
            size = { height = 0.5, width = 50 },
          },
          {
            title = "Neotest Summary",
            ft = "neotest-summary",
            size = { width = 50 },
          },
          {
            title = "Neo-Tree Git",
            ft = "neo-tree",
            filter = function(buf)
              return vim.b[buf].neo_tree_source == "git_status"
            end,
            pinned = true,
            open = "Neotree position=right git_status",
            size = { width = 50 },
          },
          {
            title = "Neo-Tree Buffers",
            ft = "neo-tree",
            filter = function(buf)
              return vim.b[buf].neo_tree_source == "buffers"
            end,
            pinned = true,
            open = "Neotree position=top buffers",
            size = { width = 50 },
          },
          "neo-tree",
        },
        keys = {
          -- increase width
          ["<c-Right>"] = function(win)
            win:resize("width", 2)
          end,
          -- decrease width
          ["<c-Left>"] = function(win)
            win:resize("width", -2)
          end,
          -- increase height
          ["<c-Up>"] = function(win)
            win:resize("height", 2)
          end,
          -- decrease height
          ["<c-Down>"] = function(win)
            win:resize("height", -2)
          end,
        },
        animate = {
          enabled = false,
        },
      }
      return opts
    end,
  },
}
