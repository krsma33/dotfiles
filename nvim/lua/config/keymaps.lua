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

map({ "n", "v" }, "q", "<nop>", { silent = true })

map("i", "<S-Tab>", "<BS>", { noremap = true, silent = true, desc = "Backspace" })
map("i", "jk", "<ESC>", { noremap = true, silent = true, desc = "Exit insert mode" })

map("x", "p", "P", { noremap = true, desc = "Paste without replacing yank register" })
map("x", "P", "p", { noremap = true, desc = "Paste with replacing yank register with pasted over text" })

map({ "i", "x", "n", "s" }, "<C-S-s>", "<cmd>wa<CR>", { noremap = true, silent = true, desc = "Save all buffers" })
