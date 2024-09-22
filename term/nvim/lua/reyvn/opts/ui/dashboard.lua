local dashboard = require('mini.starter')
local my_items = {
  dashboard.sections.builtin_actions(),
  { name = 'Explore', action = ":Oil", section = 'Files'},
  { name = 'Find File', action = ":Telescope find_files", section = 'Files'},
  { name = 'Recent File', action = ":Telescope oldfiles", section = 'Files'},
  
  { name = 'Notes', action = ":Telescope find_files cwd=/home/reyvn/Dev/Notes/ReyVault/", section = 'Special'},
  { name = 'Settings', action = ":Telescope find_files cwd=/home/reyvn/.config/nvim/", section = 'Special'},
}

dashboard.setup({
  items = {
    my_items, 
  },

  silent = true
})
