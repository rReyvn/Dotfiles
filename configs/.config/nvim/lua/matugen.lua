 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#131315',
    base01 = '#1f2021',
    base02 = '#292a2c',
    base03 = '#8e9197',
    base04 = '#c4c6cd',
    base05 = '#e4e2e4',
    base06 = '#e4e2e4',
    base07 = '#e4e2e4',
    base08 = '#ffb4ab',
    base09 = '#dcbddb',
    base0A = '#c0c7d2',
    base0B = '#b5c8e3',
    base0C = '#dcbddb',
    base0D = '#b5c8e3',
    base0E = '#c0c7d2',
    base0F = '#dce3ef',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- telescope.nvim
  hi('TelescopeNormal',         { fg = '#e4e2e4',          bg = '#131315' })
  hi('TelescopeBorder',         { fg = '#8e9197',             bg = '#131315' })
  hi('TelescopePromptNormal',   { fg = '#e4e2e4',          bg = '#131315' })
  hi('TelescopePromptBorder',   { fg = '#8e9197',             bg = '#131315' })
  hi('TelescopePromptPrefix',   { fg = '#b5c8e3',             bg = '#131315' })
  hi('TelescopePromptCounter',  { fg = '#c4c6cd',  bg = '#131315' })
  hi('TelescopePromptTitle',    { fg = '#131315',             bg = '#b5c8e3' })
  hi('TelescopePreviewTitle',   { fg = '#131315',             bg = '#c0c7d2' })
  hi('TelescopeResultsTitle',   { fg = '#131315',             bg = '#dcbddb' })
  hi('TelescopeSelection',      { fg = '#e4e2e4',          bg = '#292a2c' })
  hi('TelescopeSelectionCaret', { fg = '#b5c8e3',             bg = '#292a2c' })
  hi('TelescopeMatching',       { fg = '#b5c8e3',             bold = true })

  -- mini.pick
  hi('MiniPickNormal',         { fg = '#e4e2e4',          bg = '#131315' })
  hi('MiniPickBorder',         { fg = '#8e9197',             bg = '#131315' })
  hi('MiniPickPrompt',   { fg = '#e4e2e4',          bg = '#131315' })
  hi('MiniPickPromptPrefix',   { fg = '#b5c8e3',             bg = '#131315' })
  hi('MiniPickBorderText',    { fg = '#131315',             bg = '#b5c8e3' })
  hi('MiniPickMatchCurrent',      { fg = '#e4e2e4',          bg = '#292a2c' })
  hi('MiniPickPromptCaret', { fg = '#b5c8e3',             bg = '#292a2c' })
  hi('MiniPickMatchRanges',       { fg = '#b5c8e3',             bold = true })
end

-- Register a signal handler for SIGUSR1 (matugen updates).
-- The handler re-requires this module, which re-runs the code below, so the
-- previous handle is stopped first; otherwise handlers double on every signal.
if _G.__matugen_signal then
  _G.__matugen_signal:stop()
  _G.__matugen_signal:close()
end

local signal = vim.uv.new_signal()
_G.__matugen_signal = signal
signal:start(
  'sigusr1',
  vim.schedule_wrap(function()
    package.loaded['matugen'] = nil
    require('matugen').setup()
  end)
)

return M
