return {
	{
		"neovim/nvim-lspconfig",
		init = require("plugins.lspconfig.init")(),
		opts = {
			inlay_hints = { enabled = true },
			codelens = { enabled = false },
			servers = {
				-- omnisharp = require("plugins.lspconfig.omnisharp"),
				-- csharp_ls = require("plugins.lspconfig.csharp_ls"),
				yamlls = require("plugins.lspconfig.yamlls"),
			},
		},
	},
	-- {
	--   "Decodetalkers/csharpls-extended-lsp.nvim",
	--   lazy = true,
	-- },
	{
		"krsma33/roslyn.nvim",
		ft = "cs",
		opts = require("plugins.lspconfig.roslyn"),
	},
}
