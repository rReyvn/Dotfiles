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

-- Move line
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { silent = true })

-- Buffer Movement
vim.keymap.set("n", "<leader><Tab>", ":bnext<CR>", { desc = "Go to next buffer", silent = true })
vim.keymap.set("n", "<leader><S-Tab>", ":bprevious<CR>", { desc = "Go to previous buffer", silent = true })

-- [ Plugin Keymap ]
-- Builtin Keymap aren't managed in here
-- Look for individual plugin file to make custom keymap

-- Toggle
vim.keymap.set("n", "<leader>ti", "<Plug>(IBLToggle)", { desc = "Toggle Indent Blankline" })
vim.keymap.set("n", "<leader>tc", "<Plug>(ColorizerToggle)", { desc = "Toggle Color" })

-- Session
vim.keymap.set("n", "<leader>Sa", "<Plug>(SessionAvailableCommands)", { desc = "[S]ession [A]vailable commands" })
vim.keymap.set("n", "<leader>Sl", "<Plug>(SessionLoad)", { desc = "[S]ession [L]oad" })
vim.keymap.set("n", "<leader>Ss", "<Plug>(SessionSave)", { desc = "[S]ession [S]ave" })

-- Grapple & Buffer Management
vim.keymap.set("n", "<tab>t", "<Plug>(GrappleTag)", { desc = "Grapple toggle tag" })
vim.keymap.set("n", "<tab><tab>", "<Plug>(GrappleOpenTag)", { desc = "Grapple open tags window", silent = true })
vim.keymap.set("n", "<tab>l", "<Plug>(GrappleNextTag)", { desc = "Grapple cycle next tag", silent = true })
vim.keymap.set("n", "<tab>h", "<Plug>(GrapplePreviousTag)", { desc = "Grapple cycle previous tag", silent = true })
vim.keymap.set("n", "<leader>bf", "<Plug>(BufferFormat)", { desc = "[B]uffer [F]ormat" })

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

-- Git & Telescope Git
vim.keymap.set("n", "[h", "<Plug>(GitsignsPreviousHunk)", { desc = "Git Previous Hunk" })
vim.keymap.set("n", "]h", "<Plug>(GitsignsNextHunk)", { desc = "Git Next Hunk" })
vim.keymap.set("n", "<leader>gp", "<Plug>(GitsignsPreview)", { desc = "[G]itsigns [P]review" })
vim.keymap.set("n", "<leader>gs", "<Plug>(TelescopeGitStatus)", { desc = "[G]it [S]tatus" })
vim.keymap.set("n", "<leader>gS", "<Plug>(TelescopeGitStash)", { desc = "[G]it [S]tash" })
vim.keymap.set("n", "<leader>gb", "<Plug>(TelescopeGitBranches)", { desc = "[G]it [B]ranch" })
vim.keymap.set("n", "<leader>gc", "<Plug>(TelescopeGitCommits)", { desc = "[G]it [C]ommits" })

-- Workspace
vim.keymap.set("n", "<leader>wl", "<Plug>(ProjectWorkspaces)", { desc = "[W]orkspaces [L]ist", silent = true })

-- LSP
vim.keymap.set("n", "gd", "<Plug>(LSPDefinition)", { desc = "LSP: [G]o [D]efinition" })
vim.keymap.set("n", "gr", "<Plug>(LSPReferences)", { desc = "LSP: [G]o [R]eferences" })
vim.keymap.set("n", "gI", "<Plug>(LSPImplementations)", { desc = "LSP: [G]o [I]mplementations" })
vim.keymap.set("n", "gD", "<Plug>(LSPDeclaration)", { desc = "LSP: [G]o [D]eclaration" })
vim.keymap.set("n", "<leader>D", "<Plug>(LSPTypeDefinitions)", { desc = "LSP: Type [D]efinition" })
vim.keymap.set("n", "<leader>ds", "<Plug>(LSPDocumentSymbols)", { desc = "LSP: [D]ocument [S]ymbols" })
vim.keymap.set("n", "<leader>rn", "<Plug>(LSPRename)", { desc = "LSP: [R]e[n]ame" })
vim.keymap.set("n", "<leader>ca", "<Plug>(LSPCodeAction)", { desc = "LSP: [C]ode [A]ction" })
vim.keymap.set("n", "<leader>ws", "<Plug>(LSPWorkspaceSymbols)", { desc = "LSP: [W]orkspace [S]ymbols" })
