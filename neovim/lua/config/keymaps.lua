-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

-- General
map("n", "U", "<C-r>", { noremap = true, silent = true, desc = "Redo" })
map("n", "gh", "_", { noremap = true, silent = true, desc = "Go to start of first word in the line" })
map("n", "gl", "$", { noremap = true, silent = true, desc = "Go to end of the line" })
map("n", "n", "nzzzv", { noremap = true, silent = true })
map("n", "N", "Nzzzv", { noremap = true, silent = true })
map("n", "<F2>", "q", { noremap = true, silent = true })

map("n", "<leader>ct", function()
  require("copilot.suggestion").toggle_auto_trigger()
end, { desc = "Toggle Copilot auto trigger" })

-- neovim >= 0.10
if not (vim.version().major == 0 and vim.version().minor < 10) then
  if vim.lsp.inlay_hint.enable then
    map("n", "<leader>cL", function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
    end, { desc = "Toggle Inlay Hints" })
  end
end

map({ "n", "v" }, "q", "<nop>", { silent = true })

map("i", "<S-Tab>", "<BS>", { noremap = true, silent = true, desc = "Backspace" })
map("i", "jk", "<ESC>", { noremap = true, silent = true, desc = "Exit inster mode" })
map("i", "<C-h>", "<Left>", { noremap = true, silent = true })
map("i", "<C-j>", "<Down>", { noremap = true, silent = true })
map("i", "<C-k>", "<Up>", { noremap = true, silent = true })
map("i", "<C-l>", "<Right>", { noremap = true, silent = true })

map("x", "p", "P", { noremap = true, desc = "Paste without replacing yank register" })
map("x", "P", "p", { noremap = true, desc = "Paste with replacing yank register with pasted over text" })
