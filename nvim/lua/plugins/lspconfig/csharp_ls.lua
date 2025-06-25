return {
  handlers = {
    ["textDocument/definition"] = function(...)
      return require("csharpls_extended").handler(...)
    end,
    ["textDocument/typeDefinition"] = function(...)
      return require("csharpls_extended").handler(...)
    end,
  },
  cmd = {
    os.getenv("HOME")
      .. "/.config/csharp-language-server/src/CSharpLanguageServer/bin/Release/net8.0/CSharpLanguageServer",
  },
  keys = {
    {
      "gd",
      function()
        require("csharpls_extended").lsp_definitions()
      end,
      desc = "Goto Definition",
    },
  },
}
