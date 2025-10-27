-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Enable code lens
vim.api.nvim_create_autocmd({ "LspAttach" }, {
  callback = function(args)
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    if client and client:supports_method("textDocument/codeLens") then
      vim.lsp.codelens.refresh()
      vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave", "BufWritePre" }, {
        buffer = bufnr,
        callback = vim.lsp.codelens.refresh,
      })
    end
  end,
})

-- Refresh code lens when roslyn is initialized
vim.api.nvim_create_autocmd("User", {
  pattern = "RoslynInitialized",
  callback = function()
    vim.lsp.codelens.refresh()
  end,
})

-- Suppress Noice Progress errors for roslyn
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "cs" },
  callback = function()
    vim.api.nvim_clear_autocmds({
      group = "noice_lsp_progress",
      event = "LspProgress",
      pattern = "*",
    })
  end,
})
