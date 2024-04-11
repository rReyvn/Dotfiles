local lualine = require("lualine")

local accent_color = "#d8a657"

local conditions = {
	buffer_not_empty = function()
		return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
	end,
	hide_in_width = function()
		return vim.fn.winwidth(0) > 75
	end,
}

local config = {
	theme = "gruvbox-material",
	options = {
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		-- Single Statusline instead one per every window
		globalstatus = true,
	},
	sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_y = {},
		lualine_z = {},
		lualine_c = {},
		lualine_x = {},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_y = {},
		lualine_z = {},
		lualine_c = {},
		lualine_x = {},
	},
}

local function ins_left(component)
	table.insert(config.sections.lualine_c, component)
end

local function ins_right(component)
	table.insert(config.sections.lualine_x, component)
end

ins_left({
	function()
		return "▊"
	end,
	color = { fg = accent_color },
	padding = { right = 1 },
})

ins_left({
	"mode",
	padding = { right = 1 },
})

ins_left({
	"filename",
	cond = conditions.buffer_not_empty,
})

ins_left({
	"diagnostics",
	always_visible = false,
	colored = true,
})

ins_right({
	"location",
})
ins_right({
	"branch",
	icon = "",
	cond = conditions.hide_in_width,
})

ins_right({
	"diff",
	cond = conditions.hide_in_width,
})

ins_right({
	"encoding",
	cond = conditions.hide_in_width,
	fmt = string.upper,
})

ins_right({
	"fileformat",
	cond = conditions.hide_in_width,
	icons_enabled = true,
	symbols = {
		unix = "LF",
		dos = "CRLF",
		mac = "CR",
	},
})

ins_right({
	"filetype",
	icons_enabled = false,
	cond = conditions.buffer_not_empty,
	fmt = string.upper,
	padding = { left = 1 },
})

ins_right({
	function()
		return "▊"
	end,
	color = { fg = accent_color },
	padding = { left = 1 },
})

lualine.setup(config)
