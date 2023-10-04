-- [nfnl] Compiled from fnl/plugins/theme.fnl by https://github.com/Olical/nfnl, do not edit.
local styles = {comments = {italic = true}, keywords = {italic = true}, functions = {bold = true}, variables = {italic = false}, sidebars = "transparent", floats = "transparent"}
local tokyonight_config
local function _1_(hl, c)
  hl.CursorLineNr = {fg = "#99a0c7"}
  hl.LineNr = {fg = "#586085"}
  return nil
end
tokyonight_config = {style = "moon", styles = styles, transparent = true, transparent_background = true, dim_inactive = true, terminal_colors = true, on_highlights = _1_}
local function _2_()
  local theme = require("tokyonight")
  theme.setup(tokyonight_config)
  return vim.cmd("colorscheme tokyonight-moon")
end
return {{"rose-pine/neovim", priority = 1000, lazy = false}, {"catppuccin/nvim", priority = 1000, lazy = false}, {"folke/tokyonight.nvim", priority = 1000, config = _2_, lazy = false}}
