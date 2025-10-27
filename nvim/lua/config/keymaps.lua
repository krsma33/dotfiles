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

-- Insert mode
map("i", "<S-Tab>", "<BS>", { noremap = true, silent = true, desc = "Backspace" })
map("i", "jk", "<ESC>", { noremap = true, silent = true, desc = "Exit insert mode" })

-- Paste without replacing yank register swap
map("x", "p", "P", { noremap = true, desc = "Paste without replacing yank register" })
map("x", "P", "p", { noremap = true, desc = "Paste with replacing yank register with pasted over text" })

-- Save All
map({ "i", "x", "n", "s" }, "<C-S-s>", "<cmd>wa<CR>", { noremap = true, silent = true, desc = "Save all buffers" })

-- Copilot
map({ "i", "x" }, "<M-l>", "copilot#Accept()", { expr = true, noremap = true, silent = true, desc = "Accept copilot suggestion" })
map({ "i", "x" }, "<M-j>", "copilot#Next()", { expr = true, noremap = true, silent = true, desc = "Next suggestion" })
map({ "i", "x" }, "<M-k>", "copilot#Previous()", { expr = true, noremap = true, silent = true, desc = "Previous suggestion" })
map({ "i", "x" }, "<M-h>", "copilot#Dismiss()", { expr = true, noremap = true, silent = true, desc = "Dismiss suggestion" })

-- LSP
map({ "n", "v" }, "<C-.>", vim.lsp.buf.code_action, { noremap = true, silent = true, desc = "Code Action" })
map({ "n", "v" }, "<C-S-.>", function()
  vim.lsp.buf.code_action({
    context = {
      only = {
        "source",
      },
      diagnostics = {},
    },
  })
end, { noremap = true, silent = true, desc = "Source Action" })
map("n", "gi", vim.lsp.buf.implementation, { noremap = true, silent = true, desc = "Goto Implementation" })
map({ "n", "v" }, "<C-r><C-r>", vim.lsp.buf.rename, { noremap = true, silent = true, desc = "Rename" })
map({ "n", "i" }, "<C-S-Space>", vim.lsp.buf.signature_help, { noremap = true, silent = true, desc = "Signature Help" })
