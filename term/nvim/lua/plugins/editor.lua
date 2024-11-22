return {
  {
    "lewis6991/gitsigns.nvim",
    dependencies = {
      {
        "sindrets/diffview.nvim",
        config = true,
      },
    },
  },

  {
    "lewis6991/satellite.nvim",
    event = "BufWinEnter",
    opts = { excluded_filetypes = { "prompt", "TelescopePrompt", "noice", "notify", "neo-tree" } },
  },

  {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    event = {
      "BufReadPre " .. vim.fn.expand "~" .. "/Dev/Notes/ReyVault/**.md",
      "BufNewFile " .. vim.fn.expand "~" .. "/Dev/Notes/ReyVault/**.md",
    },
    config = function()
      require "configs.obsidian"
    end,
  },
}
