return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    config = function()
      require "configs.treesitter"
    end,
  },

  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "mfussenegger/nvim-lint",
    opts = require "configs.linter",
  },

  {
    "folke/ts-comments.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {},
  },

  {
    "folke/todo-comments.nvim",
    event = { "BufReadPost", "BufNewFile" },
    cmd = "TodoTelescope",
    opts = {},
  },

  {
    "razak17/tailwind-fold.nvim",
    event = { "BufReadPost", "BufNewFile" },
    ft = { "html", "svelte", "astro", "vue", "typescriptreact", "php", "blade" },
    opts = {
      enabled = false,
      min_chars = 50,
    },
  },
}
