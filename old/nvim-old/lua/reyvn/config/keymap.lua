-- Yank Remap
vim.keymap.set("n", "<leader>ya", ":%y+<CR>", { desc = "[Y]ank [A]ll" })
vim.keymap.set({ "n", "v" }, "<leader>yc", '"+y', { desc = "[Y]ank to system [C]lipboard" })
vim.keymap.set("n", "<leader>yy", '"+Y', { desc = "Yank line to system clipboard" })

-- Paste from system clipboard
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p', { desc = "Paste from system clipboard" })

-- Don't yank replaced text
vim.keymap.set("x", "p", 'p:let @+=@0<CR>:let @"=@0<CR>', { silent = true })

-- Always center scroll
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-f>", "<C-f>zz")
vim.keymap.set("n", "<C-b>", "<C-b>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Buffer Movement
vim.keymap.set("n", "<leader><Tab>", ":bnext<CR>", { desc = "Go to next buffer", silent = true })
vim.keymap.set("n", "<leader><S-Tab>", ":bprevious<CR>", { desc = "Go to previous buffer", silent = true })

-- File Browser
vim.keymap.set("n", "-", ":Oil<CR>", { desc = "File Explore", silent = true })

-- Telescope
vim.keymap.set("n", "<leader>sh", "<Plug>(TelescopeSearchHelp)", { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sk", "<Plug>(TelescopeSearchKeymaps)", { desc = "[S]earch [K]eymaps" })
vim.keymap.set("n", "<leader>sf", "<Plug>(TelescopeSearchFiles)", { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>ss", "<Plug>(TelescopeSearchCommands)", { desc = "[S]earch [S]elect Telescope" })
vim.keymap.set("n", "<leader>scw", "<Plug>(TelescopeSearchGrepString)", { desc = "[S]earch [C]urrent [W]ord" })
vim.keymap.set("n", "<leader>sg", "<Plug>(TelescopeSearchGrep)", { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>sd", "<Plug>(TelescopeSearchDiagnostic)", { desc = "[S]earch [D]iagnostics" })
vim.keymap.set("n", "<leader>sr", "<Plug>(TelescopeSearchResume)", { desc = "[S]earch [R]esume" })
vim.keymap.set("n", "<leader>s.", "<Plug>(TelescopeSearchRecent)", { desc = '[S]earch Recent Files ("." for repeat)' })
vim.keymap.set("n", "<leader><leader>", "<Plug>(TelescopeSearchExistBuffer)", { desc = "[ ] Find existing buffers" })
vim.keymap.set("n", "<leader>/", "<Plug>(TelescopeSearchInBuffer)", { desc = "[/] Fuzzily search in current buffer" })
vim.keymap.set("n", "<leader>s/", "<Plug>(TelescopeSearchInOpenFiles)", { desc = "Live Grep in Open Files" })
vim.keymap.set("n", "<leader>sn", "<Plug>(TelescopeSearchNeovimFiles)", { desc = "[S]earch [N]eovim files" })
