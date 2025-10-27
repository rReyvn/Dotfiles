require("nvchad.configs.lspconfig").defaults()

local servers = {
  "html",
  "cssls",
  "jsonls",
  "bashls",
  "fish_lsp",
}

vim.lsp.enable(servers)
