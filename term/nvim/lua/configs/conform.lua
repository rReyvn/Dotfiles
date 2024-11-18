local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettierd", "prettier", stop_after_firsts = true },
    html = { "prettierd", "prettier", stop_after_firsts = true },
    php = { "pint" },
    blade = { "blade-formatter" },
  },

  -- format_on_save = {
  -- These options will be passed to conform.format()
  -- timeout_ms = 500,
  -- lsp_fallback = true,
  -- },
}

return options
