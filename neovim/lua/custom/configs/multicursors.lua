local M = {}

M.setup = function()
  require("multicursors").setup {
    normal_keys = {
      ["u"] = { method = "u", opts = { desc = "Undo" } },
      ["U"] = { method = "<C-r>", opts = { "Redo" } },
    },
    insert_keys = {
      ["jk"] = { method = nil, opts = { desc = "exit", exit = true } },
    },
    hint_config = false,
    generate_hints = {
      normal = false,
      insert = false,
      extend = false,
    },
  }
end

function M.set_highlights()
  vim.api.nvim_set_hl(0, "MultiCursor", { fg = "#ffffcc", default = true })
  vim.api.nvim_set_hl(0, "MultiCursorMain", { fg = "#ffbb99", default = true })
end

return M
