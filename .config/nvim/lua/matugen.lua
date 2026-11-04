 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#131315',
    base01 = '#1f1f21',
    base02 = '#2a2a2b',
    base03 = '#8f9097',
    base04 = '#c5c6cd',
    base05 = '#e4e2e4',
    base06 = '#e4e2e4',
    base07 = '#e4e2e4',
    base08 = '#ffb4ab',
    base09 = '#dbbed7',
    base0A = '#c2c6d2',
    base0B = '#bac7e1',
    base0C = '#dbbed7',
    base0D = '#bac7e1',
    base0E = '#c2c6d2',
    base0F = '#dee2ee',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- telescope.nvim
  hi('TelescopeNormal',         { fg = '#e4e2e4',          bg = '#131315' })
  hi('TelescopeBorder',         { fg = '#8f9097',             bg = '#131315' })
  hi('TelescopePromptNormal',   { fg = '#e4e2e4',          bg = '#131315' })
  hi('TelescopePromptBorder',   { fg = '#8f9097',             bg = '#131315' })
  hi('TelescopePromptPrefix',   { fg = '#bac7e1',             bg = '#131315' })
  hi('TelescopePromptCounter',  { fg = '#c5c6cd',  bg = '#131315' })
  hi('TelescopePromptTitle',    { fg = '#131315',             bg = '#bac7e1' })
  hi('TelescopePreviewTitle',   { fg = '#131315',             bg = '#c2c6d2' })
  hi('TelescopeResultsTitle',   { fg = '#131315',             bg = '#dbbed7' })
  hi('TelescopeSelection',      { fg = '#e4e2e4',          bg = '#2a2a2b' })
  hi('TelescopeSelectionCaret', { fg = '#bac7e1',             bg = '#2a2a2b' })
  hi('TelescopeMatching',       { fg = '#bac7e1',             bold = true })

  -- mini.pick
  hi('MiniPickNormal',         { fg = '#e4e2e4',          bg = '#131315' })
  hi('MiniPickBorder',         { fg = '#8f9097',             bg = '#131315' })
  hi('MiniPickPrompt',   { fg = '#e4e2e4',          bg = '#131315' })
  hi('MiniPickPromptPrefix',   { fg = '#bac7e1',             bg = '#131315' })
  hi('MiniPickBorderText',    { fg = '#131315',             bg = '#bac7e1' })
  hi('MiniPickMatchCurrent',      { fg = '#e4e2e4',          bg = '#2a2a2b' })
  hi('MiniPickPromptCaret', { fg = '#bac7e1',             bg = '#2a2a2b' })
  hi('MiniPickMatchRanges',       { fg = '#bac7e1',             bold = true })
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
