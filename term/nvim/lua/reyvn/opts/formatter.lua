require("conform").setup({
	-- Define your formatters
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { { "prettierd", "prettier" } },
		css = { { "prettierd", "prettier" } },
		html = { { "prettierd", "prettier" } },
		markdown = { { "prettierd", "prettier" } },
		bash = { "shfmt" },
		json = { { "prettierd", "prettier" } },
		-- python = { "isort", "black" },
		-- blade = { "blade_formatter" },
	},
	-- Set up format-on-save
	-- format_on_save = { timeout_ms = 500, lsp_fallback = true },
	-- Customize formatters
	formatters = {
		shfmt = {
			prepend_args = { "-i", "2" },
		},
	},
})
