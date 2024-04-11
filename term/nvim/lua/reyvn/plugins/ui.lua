return {
	{
		"goolord/alpha-nvim",
		config = function()
			require("reyvn.opts.ui.alpha")
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		version = "3.5.4",
		keys = {
			{
				"<Plug>(IBLToggle)",
				":IBLToggle<CR>",
			},
		},
		config = function()
			require("reyvn.opts.ui.indent-blankline")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		config = function()
			require("reyvn.opts.ui.lualine")
		end,
	},
}
