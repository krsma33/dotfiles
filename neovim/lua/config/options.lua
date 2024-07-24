-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local path = require("utils.path")

-- Flash
vim.api.nvim_set_hl(0, "FlashLabelCustom", { bg = "#700060", fg = "#c8d3f5" })
-- Cmp
vim.api.nvim_set_hl(0, "CmpDocumentationCustom", { bg = "#1d1c1d" })
-- NeoTest
vim.api.nvim_set_hl(0, "NeotestAdapterName", { link = "PreProc" })
vim.api.nvim_set_hl(0, "NeotestDir", { link = "Directory" })
vim.api.nvim_set_hl(0, "NeotestFile", { link = "Type" })
vim.api.nvim_set_hl(0, "NeotestNamespace", { link = "Keyword" })
-- Disable autoformat on save
vim.g.autoformat = false
-- DIsable conceal (e.g. annoying on markdown)
vim.wo.conceallevel = 0
-- Shell
if path.is_windows then
  vim.opt.shell = "pwsh"
else
  vim.opt.shell = "zsh"
  vim.opt.clipboard = "unnamedplus"
end
