require("lint").linters_by_ft = {
	-- markdown = { "vale" },
	bash = { "shellcheck" },
	javascript = { "eslint" },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		require("lint").try_lint()
	end,
})
