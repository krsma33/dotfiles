-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd({ "LspAttach", "BufEnter", "InsertLeave" }, {
  pattern = { "*.cs", "*.rs" },
  callback = function()
    local buf = tonumber(vim.fn.expand("<abuf>"))
    if buf then
      vim.lsp.buf_request(buf, "textDocument/codeLens", { textDocument = vim.lsp.util.make_text_document_params(buf) })
    end
  end,
})
