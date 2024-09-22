-- [ Options ]
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.hlsearch = false
vim.opt.incsearch = true
-- vim.opt.clipboard = "unnamedplus"

-- [ Keymap ]
-- Yank Remap
vim.keymap.set("n", "<leader>ya", ":%y+<CR>", { desc = "[Y]ank [A]ll" })
vim.keymap.set({ "n", "v" }, "<leader>yc", '"+y', { desc = "[Y]ank to system [C]lipboard" })
vim.keymap.set("n", "<leader>yy", '"+Y', { desc = "Yank line to system clipboard" })

-- Paste from system clipboard
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p', { desc = "Paste from system clipboard" })

-- Don't yank replaced text
vim.keymap.set("x", "p", 'p:let @+=@0<CR>:let @"=@0<CR>', { silent = true })

-- VScode Action
vim.keymap.set({"n", "v"}, "<leader>sf", "<cmd>lua require('vscode').action('workbench.action.quickOpen')<CR>")

-- VSCode Harpoon
vim.keymap.set({"n", "v"}, "<Tab>a", "<cmd>lua require('vscode').action('vscode-harpoon.addEditor')<CR>")
vim.keymap.set({"n", "v"}, "<Tab><Tab>", "<cmd>lua require('vscode').action('vscode-harpoon.editorQuickPick')<CR>")
vim.keymap.set({"n", "v"}, "<Tab>e", "<cmd>lua require('vscode').action('vscode-harpoon.editEditors')<CR>")
vim.keymap.set({"n", "v"}, "<Tab>1", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor1')<CR>")
vim.keymap.set({"n", "v"}, "<Tab>2", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor2')<CR>")
vim.keymap.set({"n", "v"}, "<Tab>3", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor3')<CR>")
vim.keymap.set({"n", "v"}, "<Tab>4", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor4')<CR>")
vim.keymap.set({"n", "v"}, "<Tab>5", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor5')<CR>")
vim.keymap.set({"n", "v"}, "<Tab>6", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor6')<CR>")
vim.keymap.set({"n", "v"}, "<Tab>7", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor7')<CR>")
vim.keymap.set({"n", "v"}, "<Tab>8", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor8')<CR>")
vim.keymap.set({"n", "v"}, "<Tab>9", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor9')<CR>")

-- [ Autocmds ]
local function augroup(name)
	return vim.api.nvim_create_augroup("reyvim_" .. name, { clear = true })
end

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup("highlight_yank"),
	callback = function()
		vim.highlight.on_yank()
	end,
})
