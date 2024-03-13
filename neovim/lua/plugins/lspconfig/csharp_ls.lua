return {
	handlers = {
		["textDocument/definition"] = function(...)
			return require("csharpls_extended").handler(...)
		end,
		["textDocument/typeDefinition"] = function(...)
			return require("csharpls_extended").handler(...)
		end,
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
