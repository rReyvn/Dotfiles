local opts = {
  events = {
    "BufWritePost",
    "BufReadPost",
    "InsertLeave",
  },
  linters_by_ft = {
    fish = { "fish" },
    markdown = { "vale" },
    vue = { "eslint" },
  },
}

return opts
