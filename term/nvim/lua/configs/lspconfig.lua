-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

local servers = {
  "html",
  "cssls",
  "intelephense",
  "tailwindcss",
  "emmet_ls",
  "bashls",
  "eslint",
  "pyright",
}
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

lspconfig.ts_ls.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
}

lspconfig.emmet_ls.setup {
  filetypes = {
    "blade",
  },
}

lspconfig.html.setup {
  filetypes = {
    "blade",
  },
}

lspconfig.eslint.setup {}
lspconfig.bashls.setup {}
lspconfig.pyright.setup {}
