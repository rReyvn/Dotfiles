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
		"uga-rosa/ccc.nvim",
		cmd = { "CccPick", "CccConvert" },
		opts = {},
	},
	{
		"NvChad/nvim-colorizer.lua",
		keys = {
			{
				"<Plug>(ColorizerToggle)",
				":ColorizerToggle<CR>",
			},
		},
		config = function()
			require("reyvn.opts.utils.colorizer")
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {},
	},
	{
		"Shatur/neovim-session-manager",
		config = function()
			require("reyvn.opts.utils.session-manager")
		end,
	},
	{
		"natecraddock/workspaces.nvim",
		cmd = {
			"WorkspacesAdd",
			"WorkspacesAddDir",
			"WorkspacesList",
			"WorkspacesListDirs",
			"WorkspacesRemove",
			"WorkspacesRemoveDir",
			"WorkspacesRename",
			"WorkspacesSyncDirs",
		},
		keys = {
			{
				"<Plug>(ProjectWorkspaces)",
				":Telescope workspaces<CR>",
			},
		},
		config = function()
			require("reyvn.opts.utils.workspaces")
		end,
	},
	{
		"epwalsh/obsidian.nvim",
		version = "*",
		lazy = true,
		-- ft = "markdown",
		event = {
			"BufReadPre " .. vim.fn.expand("~") .. "/Dev/Notes/ReyVault/**.md",
			"BufNewFile " .. vim.fn.expand("~") .. "/Dev/Notes/ReyVault/**.md",
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("reyvn.opts.utils.obsidian")
		end,
	},
	{
		"cbochs/grapple.nvim",
		event = { "BufReadPost", "BufNewFile" },
		cmd = "Grapple",
		keys = {
			{
				"<Plug>(GrappleTag)",
				":Grapple toggle<cr>",
			},
			{
				"<Plug>(GrappleOpenTag)",
				":Grapple toggle_tags<cr>",
			},
			{
				"<Plug>(GrappleNextTag)",
				":Grapple cycle_tags next<cr>",
			},
			{
				"<Plug>(GrapplePreviousTag)",
				":Grapple cycle_tags prev<cr>",
			},
		},
		opts = {
			scope = "git",
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("reyvn.opts.utils.gitsigns")
		end,
	},
	{
		"echasnovski/mini.comment",
		version = "*",
		opts = {},
	},
}
