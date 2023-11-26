local M = {}
local Terminal = require("toggleterm.terminal").Terminal

local lazygit = Terminal:new {
  cmd = "lazygit",
  count = 5,
  dir = "git_dir",
  direction = "float",
  float_opts = {
    border = "single",
    width = function()
      return math.ceil(vim.o.columns * 0.96)
    end,
    height = function()
      return math.ceil(vim.o.lines * 0.91)
    end,
  },
  on_open = function(term)
    vim.cmd "startinsert!"
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
  end,
  on_close = function(_)
    vim.cmd "startinsert!"
  end,
}

M.lazygit_toggle = function()
  lazygit:toggle()
end

return M
