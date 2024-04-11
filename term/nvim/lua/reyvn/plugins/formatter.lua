return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<Plug>(BufferFormat)",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
		},
	},
	config = function()
		require("reyvn.opts.formatter")
	end,
	init = function()
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}
