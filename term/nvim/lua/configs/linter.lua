local opts = {
  events = {
    "BufWritePost",
    "BufReadPost",
    "InsertLeave",
  },
  linters_by_ft = {
    fish = { "fish" },
    vue = { "eslint" },
    bash = { "shellcheck" },
  },
}

return opts
