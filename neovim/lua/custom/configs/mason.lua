local M = {}

M.opts = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- C# stuff
    "omnisharp",
    "csharpier",
    "netcoredbg",

    -- HTML
    "prettier",

    -- Rust
    "rust-analyzer",
    "codelldb",

    -- yaml
    "yamlfix",
    "yaml-language-server",
  },
}

return M
