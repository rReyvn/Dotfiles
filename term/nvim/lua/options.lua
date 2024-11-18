require "nvchad.options"

local o = vim.o
local g = vim.g
-- o.cursorlineopt = "both" -- to enable cursorline!

o.clipboard = "" --Set "unnamedplus" to sync with system clipboard
o.shell = "/usr/bin/fish"
o.hlsearch = false
o.incsearch = true

vim.filetype.add {
  pattern = {
    [".*%.blade%.php"] = "blade",
  },
}

if g.neovide then
	o.guifont = "JetBrainsMono Nerd Font:h10"
end
