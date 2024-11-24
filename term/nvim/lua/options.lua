require "nvchad.options"

local o = vim.o
local g = vim.g
-- o.cursorlineopt = "both" -- to enable cursorline!

o.clipboard = "" --Set "unnamedplus" to sync with system clipboard
o.hlsearch = false
o.incsearch = true
o.wrap = false
o.shell = "/usr/bin/fish"

vim.filetype.add {
  pattern = {
    [".*%.blade%.php"] = "blade",
  },
}

if g.neovide then
  o.guifont = "JetBrainsMono Nerd Font:h10"
end
