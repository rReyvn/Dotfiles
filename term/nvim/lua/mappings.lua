require "nvchad.mappings"

local map = vim.keymap.set

-- Yank Remap
map("n", "<leader>ya", ":%y+<CR>", { desc = "[Y]ank [A]ll" })
map({ "n", "v" }, "<leader>yc", '"+y', { desc = "[Y]ank to system [C]lipboard" })
map("n", "<leader>yy", '"+Y', { desc = "Yank line to system clipboard" })

-- Paste from system clipboard
map({ "n", "v" }, "<leader>p", '"+p', { desc = "Paste from system clipboard" })

-- Don't yank replaced text
map("x", "p", 'p:let @+=@0<CR>:let @"=@0<CR>', { silent = true })

-- Always center scroll
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "<C-f>", "<C-f>zz")
map("n", "<C-b>", "<C-b>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Buffer Movement
-- map("n", "<leader><Tab>", ":bnext<CR>", { desc = "Go to next buffer", silent = true })
-- map("n", "<leader><S-Tab>", ":bprevious<CR>", { desc = "Go to previous buffer", silent = true })
