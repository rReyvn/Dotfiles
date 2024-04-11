local session_manager = require("session_manager")
local config = require("session_manager.config")

session_manager.setup({
	autoload_mode = config.AutoloadMode.Disabled,
	autosave_last_session = false,
})

vim.keymap.set("n", "<Plug>(SessionAvailableCommands)", ":SessionManager available_commands<CR>")
vim.keymap.set("n", "<Plug>(SessionLoad)", ":SessionManager load_session<CR>")
vim.keymap.set("n", "<Plug>(SessionSave)", ":SessionManager save_current_session<CR>")
