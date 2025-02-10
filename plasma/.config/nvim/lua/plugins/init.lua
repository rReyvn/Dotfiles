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
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    opts = function()
      return require "configs.nvimtree"
    end,
  },

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
    event = { "BufReadPost", "BufNewFile" },
    opts = { excluded_filetypes = { "prompt", "TelescopePrompt", "noice", "notify", "neo-tree", "NvimTree" } },
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

  {
    "karb94/neoscroll.nvim",
    event = { "BufReadPost", "BufNewFile" },
    cond = function()
      if not vim.g.neovide then
        return true
      end
    end,
    opts = {},
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "debugloop/telescope-undo.nvim",
        config = function()
          local map = vim.keymap.set
          map("n", "<leader>fu", "<CMD>Telescope undo<CR>", { desc = "Find undo" })

          require("telescope").load_extension "undo"
        end,
      },
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
      {
        "nvim-telescope/telescope-ui-select.nvim",
      },
      opts = {
        extensions_list = { "fzf", "ui-select" },
      },
    },
  },

  {
    "stevearc/oil.nvim",
    cmd = "Oil",
    opts = {
      delete_to_trash = true,
      view_options = {
        show_hidden = true,
      },
    },
  },

  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require "configs.betterescape"
    end,
  },

  {
    "mikesmithgh/kitty-scrollback.nvim",
    enabled = true,
    lazy = true,
    cmd = { "KittyScrollbackGenerateKittens", "KittyScrollbackCheckHealth" },
    event = { "User KittyScrollbackLaunch" },
    version = "*",
    config = function()
      require("kitty-scrollback").setup()
    end,
  },
}
