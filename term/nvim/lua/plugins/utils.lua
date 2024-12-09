return {
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
}
