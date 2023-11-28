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

return M
