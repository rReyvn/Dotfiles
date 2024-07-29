require("conform").setup({
	-- Define your formatters
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { "prettierd", "prettier", stop_after_first = true },
		css = { "prettierd", "prettier", stop_after_first = true },
		html = { "prettierd", "prettier", stop_after_first = true },
		markdown = { "prettierd", "prettier", stop_after_first = true },
		bash = { "shfmt" },
		json = { "prettierd", "prettier", stop_after_first = true },
		-- python = { "isort", "black" },
		-- blade = { "blade_formatter" },
	},
	-- Set up format-on-save
	format_on_save = { timeout_ms = 500, lsp_fallback = true },
	-- Customize formatters
	formatters = {
		shfmt = {
			prepend_args = { "-i", "2" },
		},
	},
})
