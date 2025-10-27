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

-- Disable conceal (e.g. annoying on markdown)
vim.wo.conceallevel = 0

-- Shell
if path.is_windows then
  vim.opt.shell = "pwsh"
else
  vim.opt.shell = "zsh"
  vim.opt.clipboard = "unnamedplus"

  -- Disable paste on SSH since WezTerm is not supporting OSC 52 paste
  if vim.env.SSH_TTY then
    local function paste()
      return {
        vim.fn.split(vim.fn.getreg(""), "\n"),
        vim.fn.getregtype(""),
      }
    end

    vim.g.clipboard = {
      name = "OSC 52",
      copy = {
        ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
        ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
      },
      paste = {
        ["+"] = paste,
        ["*"] = paste,
      },
    }
  end
end

-- Copilot
vim.g.copilot_no_tab_map = true
vim.g.ai_cmp = false

-- Diagnostic text config
vim.diagnostic.config({
  virtual_lines = {
    current_line = true,
  }
})

-- Lsp Configuration
vim.lsp.config("*", {
    capabilities = vim.lsp.protocol.make_client_capabilities()
})

vim.lsp.config("roslyn", {
    settings = {
      ["csharp|inlay_hints"] = {
        csharp_enable_inlay_hints_for_implicit_object_creation = true,
        csharp_enable_inlay_hints_for_implicit_variable_types = true,
        csharp_enable_inlay_hints_for_lambda_parameter_types = true,
        csharp_enable_inlay_hints_for_types = true,
        dotnet_enable_inlay_hints_for_indexer_parameters = true,
        dotnet_enable_inlay_hints_for_literal_parameters = true,
        dotnet_enable_inlay_hints_for_object_creation_parameters = true,
        dotnet_enable_inlay_hints_for_other_parameters = true,
        dotnet_enable_inlay_hints_for_parameters = true,
        dotnet_suppress_inlay_hints_for_parameters_that_differ_only_by_suffix = true,
        dotnet_suppress_inlay_hints_for_parameters_that_match_argument_name = true,
        dotnet_suppress_inlay_hints_for_parameters_that_match_method_intent = true,
      },
      ["csharp|code_lens"] = {
        dotnet_enable_references_code_lens = true,
      },
      ["csharp|background_analysis"] = {
        dotnet_analyzer_diagnostics_scope = "openFiles",
        dotnet_compiler_diagnostics_scope = "fullSolution",
      },
    },
})
