require "nvchad.mappings"

local map = vim.keymap.set
local nomap = vim.keymap.del

-- Yank Remap
map("n", "<leader>ya", ":%y+<CR>", { desc = "Yank All" })
map({ "n", "v" }, "<leader>yc", '"+y', { desc = "Yank to system Clipboard" })
map("n", "<leader>yy", '"+Y', { desc = "Yank line to system clipboard" })

-- Paste from system clipboard
map({ "n", "v" }, "<leader>p", '"+p', { desc = "Paste from system clipboard" })

-- Don't yank replaced text
map("x", "p", 'p:let @+=@0<CR>:let @"=@0<CR>', { silent = true })

-- Gitsign
map("n", "<leader>gh", "<cmd>Gitsign preview_hunk<CR>", { desc = "Gitsign preview hunk" })
map("n", "]h", "<cmd>Gitsign next_hunk<CR>", { desc = "Gitsign next hunk" })
map("n", "[h", "<cmd>Gitsign prev_hunk<CR>", { desc = "Gitsign previous hunk" })

-- Toggle
map("n", "<leader>ttf", "<cmd>TailwindFoldToggle<CR>", { desc = "Toggle tailwind fold" })

-- Custom Telescope Mapping
map("n", "<leader><space>", "<cmd>Telescope buffers previewer=false<CR>", { desc = "telescope find buffers" })

-- Tabufline (Tab Buffers)
map("n", "<A-.>", "<cmd>lua require('nvchad.tabufline').move_buf(1)<CR>", { desc = "Move buffer next" })
map("n", "<A-,>", "<cmd>lua require('nvchad.tabufline').move_buf(-1)<CR>", { desc = "Move buffer previous" })

-- File explorer
map("n", "<leader>fO", "<cmd>Oil<CR>", { desc = "Open file explorer" })
map("n", "-", "<cmd>Oil --float<CR>", { desc = "Open floating file explorer" })

nomap({ "n", "v" }, "<leader>/")
nomap("n", "<leader>n")
nomap("n", "<leader>e")
nomap("n", "<C-c>")
nomap("n", "<C-s>")

