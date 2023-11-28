local M = {}

M.opts = {
  size = function(term)
    if term.direction == "horizontal" then
      return vim.o.lines * 0.25
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.35
    end
  end,
  start_in_insert = true,
  on_open = function(term)
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<C-q>", "<cmd>close<CR>", { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "<ESC>", "<cmd>close<CR>", { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<ESC>", "<cmd>close<CR>", { noremap = true, silent = true })
  end,
  float_opts = {
    width = function()
      return math.ceil(vim.o.columns * 0.6)
    end,
    height = function()
      return math.ceil(vim.o.lines * 0.6)
    end,
  },
}

return M
