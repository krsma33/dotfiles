-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local codelens_filetypes = { "cs", "rust" }

local function shouldActivateCodelens()
  for index = 1, #codelens_filetypes do
    if codelens_filetypes[index] == vim.bo.filetype then
      return true
    end
  end
end

-- Enable code lens
vim.api.nvim_create_autocmd({ "LspAttach" }, {
  callback = function()
    if shouldActivateCodelens() then
      local buf = tonumber(vim.fn.expand("<abuf>"))
      if buf then
        vim.lsp.buf_request(
          buf,
          "textDocument/codeLens",
          { textDocument = vim.lsp.util.make_text_document_params(buf) }
        )
        vim.lsp.codelens.refresh()
      end
    end
  end,
})
-- refresh code lens
vim.api.nvim_create_autocmd({ "BufRead", "InsertLeave", "BufWritePre" }, {
  callback = function()
    if shouldActivateCodelens() then
      local buf = tonumber(vim.fn.expand("<abuf>"))
      if buf then
        vim.lsp.codelens.refresh()
      end
    end
  end,
})
