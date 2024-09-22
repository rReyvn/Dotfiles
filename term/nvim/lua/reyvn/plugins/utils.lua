return {
	{
		"stevearc/oil.nvim",
		config = function()
			require("reyvn.opts.utils.oil")
		end,
	},
	{
		"max397574/better-escape.nvim",
		event = "InsertEnter",
		config = function()
			require("reyvn.opts.utils.better-escape")
		end,
	},
  { 
    'echasnovski/mini.pairs',
    version = '*',
    opts = {}
  },
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {},
	},
	{
		"epwalsh/obsidian.nvim",
		version = "*",
		lazy = true,
		event = {
			"BufReadPre " .. vim.fn.expand("~") .. "/Dev/Notes/ReyVault/**.md",
			"BufNewFile " .. vim.fn.expand("~") .. "/Dev/Notes/ReyVault/**.md",
		},
		config = function()
			require("reyvn.opts.utils.obsidian")
		end,
	},
}
