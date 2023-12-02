-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- General
vim.keymap.set("n", "U", "<C-r>", { noremap = true, silent = true, desc = "Redo" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })
vim.keymap.set("n", "n", "nzzzv", { noremap = true, silent = true })
vim.keymap.set("n", "N", "Nzzzv", { noremap = true, silent = true })

vim.keymap.set("i", "<S-Tab>", "<BS>", { noremap = true, silent = true, desc = "Backspace" })
vim.keymap.set("i", "jk", "<ESC>", { noremap = true, silent = true, desc = "Exit inster mode" })
