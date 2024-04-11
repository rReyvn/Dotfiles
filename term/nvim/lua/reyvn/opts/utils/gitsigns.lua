require("gitsigns").setup({
	on_attach = function(bufnr)
		vim.keymap.set(
			"n",
			"<Plug>(GitsignsPreviousHunk)",
			require("gitsigns").prev_hunk,
			{ buffer = bufnr, desc = "Git Previous Hunk" }
		)
		vim.keymap.set(
			"n",
			"<Plug>(GitsignsNextHunk)",
			require("gitsigns").next_hunk,
			{ buffer = bufnr, desc = "Git Next Hunk" }
		)
		vim.keymap.set(
			"n",
			"<Plug>(GitsignsPreview)",
			require("gitsigns").preview_hunk,
			{ buffer = bufnr, desc = "[G]itsigns [P]review" }
		)
	end,
})
