local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettierd", "prettier", stop_after_firsts = true },
    html = { "prettierd", "prettier", stop_after_firsts = true },
    javascript = { "prettierd", "prettier", stop_after_firsts = true },
    json = { "prettierd", "prettier", stop_after_firsts = true },
    bash = { "shfmt" },
    python = { "black" },
    fish = { "fish_indent" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 3000,
    lsp_fallback = true,
  },
}

return options
