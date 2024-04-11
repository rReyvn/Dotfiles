local map = vim.keymap.set

-- [ Options ]
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- [ Keymap ]
-- Don't yank replaced text
map("x", "p", 'p:let @+=@0<CR>:let @"=@0<CR>', { silent = true })

-- VScode Action
map({ "n", "v" }, "<leader>ff", "<cmd>lua require('vscode').action('workbench.action.quickOpen')<CR>")
map("n", "<leader>x", "<cmd>lua require('vscode').action('workbench.action.closeActiveEditor')<CR>")
map("n", "<Tab>", "<cmd>lua require('vscode').action('workbench.action.nextEditor')<CR>")
map("n", "<S-Tab>", "<cmd>lua require('vscode').action('workbench.action.previousEditor')<CR>")

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
