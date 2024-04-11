---@diagnostic disable-next-line: missing-fields
require("nvim-treesitter.configs").setup({
	ensure_installed = { "html", "css", "lua", "markdown", "vim", "vimdoc" },
	sync_install = false,
	ignore_install = {},
	auto_install = true,
	highlight = { enable = true },
	-- indent = { enable = true },
	autotag = { enable = true },
})
