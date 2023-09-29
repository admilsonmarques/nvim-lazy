-- [nfnl] Compiled from fnl/plugins/theme.fnl by https://github.com/Olical/nfnl, do not edit.
local styles = {comments = {italic = true}, keywords = {italic = true}, functions = {bold = true}, variables = {italic = false}, sidebars = "transparent", floats = "transparent"}
local tokyonight_config = {style = "moon", styles = styles, transparent = true, transparent_background = true, dim_inactive = true, terminal_colors = true}
local function _1_()
  local theme = require("tokyonight")
  theme.setup(tokyonight_config)
  return vim.cmd("colorscheme tokyonight-moon")
end
return {{"rose-pine/neovim", priority = 1000, lazy = false}, {"catppuccin/nvim", priority = 1000, lazy = false}, {"folke/tokyonight.nvim", priority = 1000, config = _1_, lazy = false}}
