do
  vim.loader.enable()
  vim.g.mapleader = ' '
  vim.g.maplocalleader = ' '
  vim.g.have_nerd_font = true
  vim.o.number = true
  vim.o.relativenumber = true
  vim.o.mouse = 'a'
  vim.o.breakindent = true
  vim.o.undofile = true
  vim.o.ignorecase = true
  vim.o.smartcase = true
  vim.o.signcolumn = 'yes'
  vim.o.updatetime = 250
  vim.o.timeoutlen = 300
  vim.o.splitright = true
  vim.o.splitbelow = true
  vim.o.list = true
  vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
  vim.o.inccommand = 'split'
  vim.o.cursorline = true
  vim.o.scrolloff = 10
  vim.o.confirm = true
  vim.o.tabstop = 2
  vim.o.shiftwidth = 2
  vim.o.softtabstop = 2
  vim.o.expandtab = true
  vim.o.smarttab = true

  vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function() vim.hl.on_yank() end,
  })

  vim.pack.add({
    'https://github.com/RRethy/base16-nvim',
  })

  local ok, matugen = pcall(require, 'matugen')
  if ok then matugen.setup() end
end

