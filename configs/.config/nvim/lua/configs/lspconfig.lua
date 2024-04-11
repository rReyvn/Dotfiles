require("neoconf").setup {}

-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "jsonls", "bashls", "fish_lsp" }
vim.lsp.enable(servers)
