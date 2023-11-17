local M = {}

M.opts = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- C# stuff
    "omnisharp",
    "csharpier",

    -- HTML
    "prettier",

    -- yaml
    "yamlfix",
  },
}

return M

