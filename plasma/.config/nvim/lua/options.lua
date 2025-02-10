require "nvchad.options"

local o = vim.o
local g = vim.g

o.clipboard = "" --Set "unnamedplus" to sync with system clipboard
o.hlsearch = false
o.incsearch = true
o.wrap = false
o.shell = "/usr/bin/fish"
o.relativenumber = true
o.scrolloff = 10
o.termguicolors = true
