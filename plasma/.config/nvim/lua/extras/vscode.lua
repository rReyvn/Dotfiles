-- [ Options ]
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.hlsearch = false
vim.opt.incsearch = true
-- vim.opt.clipboard = "unnamedplus"

-- [ Keymap ]
-- Don't yank replaced text
vim.keymap.set("x", "p", 'p:let @+=@0<CR>:let @"=@0<CR>', { silent = true })

-- VScode Action
vim.keymap.set({ "n", "v" }, "<leader>ff", "<cmd>lua require('vscode').action('workbench.action.quickOpen')<CR>")
vim.keymap.set("n", "<Tab>", "<cmd>lua require('vscode').action('workbench.action.nextEditor')<CR>")
vim.keymap.set("n", "<S-Tab>", "<cmd>lua require('vscode').action('workbench.action.previousEditor')<CR>")
vim.keymap.set("n", "<leader>x", "<cmd>lua require('vscode').action('workbench.action.closeActiveEditor')<CR>")

-- [ Autocmds ]
local function augroup(name)
  return vim.api.nvim_create_augroup("reyvim_" .. name, { clear = true })
end

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup "highlight_yank",
  callback = function()
    vim.highlight.on_yank()
  end,
})
