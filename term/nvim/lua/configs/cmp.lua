local cmp = require "cmp"
local neocodeium = require "neocodeium"
local commands = require "neocodeium.commands"

cmp.event:on("menu_opened", function()
  neocodeium.clear()
end)

neocodeium.setup {
  filter = function()
    return not cmp.visible()
  end,

  filetypes = {
    TelescopePrompt = false,
    ["dap-repl"] = false,
  },
}

cmp.setup {
  completion = {
    autocomplete = false,
  },
}
