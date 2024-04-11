return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Automatically install LSPs and related tools to stdpath for neovim
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		config = function()
			require("reyvn.opts.lspconfig")
		end,
	},
	{
		"folke/neodev.nvim",
		ft = "lua",
		opts = {},
	},
}
