return {
  opts = {
    bottom = {
      {
        ft = "toggleterm",
        size = { height = 0.35 },
        filter = function(_, win)
          return vim.api.nvim_win_get_config(win).relative == ""
        end,
      },
      {
        ft = "noice",
        size = { height = 0.35 },
        filter = function(_, win)
          return vim.api.nvim_win_get_config(win).relative == ""
        end,
      },
      {
        ft = "lazyterm",
        title = "Terminal",
        size = { height = 0.35 },
        filter = function(buf)
          return not vim.b[buf].lazyterm_cmd
        end,
      },
      "Trouble",
      {
        ft = "trouble",
        size = { height = 0.35 },
        filter = function(_, win)
          return vim.api.nvim_win_get_config(win).relative == ""
        end,
      },
      {
        ft = "qf",
        title = "QuickFix",
        size = { height = 0.35 },
      },
      {
        ft = "help",
        size = { height = 0.35 },
        -- don't open help files in edgy that we're editing
        filter = function(buf)
          return vim.bo[buf].buftype == "help"
        end,
      },
      {
        title = "Spectre",
        ft = "spectre_panel",
        size = { height = 0.35 },
      },
      {
        title = "Neotest Output",
        ft = "neotest-output-panel",
        size = { height = 0.35 },
      },
    },
    left = {
      {
        title = "Explorer",
        ft = "snacks_layout_box",
        filter = function(_, win)
          return vim.api.nvim_win_get_config(win).relative == ""
        end,
        pinned = true,
        size = { height = 0.5, width = 55 },
      },
      {
        title = "Neotest Summary",
        ft = "neotest-summary",
        size = { width = 55 },
      },
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
  },
}
