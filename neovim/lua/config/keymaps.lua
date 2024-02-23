-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

-- General
map("n", "U", "<C-r>", { noremap = true, silent = true, desc = "Redo" })
map("n", "gh", "_", { noremap = true, silent = true, desc = "Go to start of first word in the line" })
map("n", "gl", "$", { noremap = true, silent = true, desc = "Go to end of the line" })
map("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
map("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })
map("n", "n", "nzzzv", { noremap = true, silent = true })
map("n", "N", "Nzzzv", { noremap = true, silent = true })
map("n", "<F2>", "q", { noremap = true, silent = true })

map({ "n", "v" }, "q", "<nop>", { silent = true })

-- neovim >= 0.10
if (vim.lsp.inlay_hint.enable and not (vim.version().major == 0 and vim.version().minor < 10)) then
  map("n", "<leader>L", function()
    if vim.lsp.inlay_hint.is_enabled() then
      vim.lsp.inlay_hint.enable(0, false)
    else
      vim.lsp.inlay_hint.enable()
    end
  end, { desc = "Toggle Inlay Hints" })
end

map("i", "<S-Tab>", "<BS>", { noremap = true, silent = true, desc = "Backspace" })
map("i", "jk", "<ESC>", { noremap = true, silent = true, desc = "Exit inster mode" })
map("i", "<C-h>", "<Left>", { noremap = true, silent = true })
map("i", "<C-j>", "<Down>", { noremap = true, silent = true })
map("i", "<C-k>", "<Up>", { noremap = true, silent = true })
map("i", "<C-l>", "<Right>", { noremap = true, silent = true })
