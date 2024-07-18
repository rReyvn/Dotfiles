vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.netrw_banner = false
vim.g.netrw_winsize = 15
vim.g.netrw_keepdir = 0 -- Sync current dir and browsing dir

vim.opt.autoindent = true
vim.opt.breakindent = true
-- vim.opt.clipboard = "" --Set "unnamedplus" to sync with system clipboard
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.conceallevel = 0
vim.opt.confirm = true
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.mouse = "a"
vim.opt.nu = true
vim.opt.rnu = true
vim.opt.scroll = 8
vim.opt.scrolloff = 10
vim.opt.shell = "/usr/bin/fish"
vim.opt.shiftwidth = 2
vim.opt.showmode = false
vim.opt.signcolumn = "yes"
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.softtabstop = 2
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.timeoutlen = 300
vim.opt.undofile = true
vim.opt.undolevels = 10000
vim.opt.updatetime = 250
vim.opt.wrap = false

if vim.g.neovide then
	vim.o.guifont = "JetBrainsMono Nerd Font:h10"
end
