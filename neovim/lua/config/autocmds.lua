-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Enable code lens
vim.api.nvim_create_autocmd({ "LspAttach" }, {
  callback = function()
    local buf = tonumber(vim.fn.expand("<abuf>"))
    if buf then
      vim.lsp.buf_request(buf, "textDocument/codeLens", { textDocument = vim.lsp.util.make_text_document_params(buf) })
      vim.lsp.codelens.refresh({ bufnr = buf })
    end
  end,
})
-- refresh code lens
vim.api.nvim_create_autocmd({ "LspAttach", "BufEnter", "InsertLeave" }, {
  callback = function()
    local buf = tonumber(vim.fn.expand("<abuf>"))
    if buf then
      vim.lsp.codelens.refresh({ bufnr = buf })
    end
  end,
})
