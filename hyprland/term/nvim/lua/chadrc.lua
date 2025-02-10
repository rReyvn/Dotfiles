-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "yoru",
}

M.cheatsheet = {
  theme = "simple",
}

M.nvdash = {
  load_on_startup = true,
  header = {
    "                                            ",
    "                                            ",
    "██████╗ ███████╗██╗   ██╗██╗   ██╗███╗   ██╗",
    "██╔══██╗██╔════╝╚██╗ ██╔╝██║   ██║████╗  ██║",
    "██████╔╝█████╗   ╚████╔╝ ██║   ██║██╔██╗ ██║",
    "██╔══██╗██╔══╝    ╚██╔╝  ╚██╗ ██╔╝██║╚██╗██║",
    "██║  ██║███████╗   ██║    ╚████╔╝ ██║ ╚████║",
    "╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝  ╚═══╝",
    "                                            ",
    "                                            ",
  },

  buttons = {
    { txt = "󰉋  File Manager", keys = "fm", cmd = ":Oil" },
    { txt = "  Find File", keys = "ff", cmd = "Telescope find_files" },
    { txt = "  Recent Files", keys = "fo", cmd = "Telescope oldfiles" },
    { txt = "󰈭  Find Word", keys = "fw", cmd = "Telescope live_grep" },
    { txt = "󰎚  Notes", keys = "fn", cmd = ":Telescope find_files cwd=/home/reyvn/Dev/Notes/ReyVault/" },
    { txt = "󱥚  Themes", keys = "th", cmd = ":lua require('nvchad.themes').open()" },
    { txt = "  Mappings", keys = "ch", cmd = "NvCheatsheet" },
    { txt = "  Settings", keys = "st", cmd = ":Telescope find_files cwd=/home/reyvn/.config/nvim/" },

    { txt = " ", hl = "NvDashFooter", no_gap = true, rep = true },

    {
      txt = function()
        local stats = require("lazy").stats()
        local ms = math.floor(stats.startuptime) .. " ms"
        return "  Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms
      end,
      hl = "NvDashFooter",
      no_gap = true,
    },

    -- { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },
  },
}

return M
