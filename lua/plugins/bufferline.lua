-- [nfnl] Compiled from fnl/plugins/bufferline.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("config.utils")
local noremap = _local_1_["noremap"]
local offset = {{filetype = "undotree", text = "Undotree", highlight = "PanelHeading", padding = 1}, {filetype = "NvimTree", text = "Explorer", highlight = "PanelHeading", padding = 1}, {filetype = "DiffviewFiles", text = "Diff View", highlight = "PanelHeading", padding = 1}, {filetype = "flutterToolsOutline", text = "Flutter Outline", highlight = "PanelHeading", padding = 1}, {filetype = "packer", text = "Packer", highlight = "PanelHeading", padding = 1}}
local opts = {options = {mode = "buffers", numbers = "none", close_command = "", right_mouse_command = "vert sbuffer %d", left_mouse_command = "buffer %d", middle_mouse_command = nil, indicator = {icon = "\226\150\142", style = "icon"}, close_icon = "\239\128\141", buffer_close_icon = "\239\153\149", modified_icon = "\226\151\143", left_trunc_marker = "\239\130\168", right_trunc_marker = "\239\130\169", diagnostics = "nvim_lsp", separator_style = "thin", hover = {enable = true, delay = 100, reveal = {"close"}}, sort_by = "directory"}}
local function _2_()
  local bufferline = require("bufferline")
  bufferline.setup(opts)
  noremap("n", "<S-l>", ":BufferLineCycleNext<CR>")
  return noremap("n", "<S-h>", ":BufferLineCyclePrev<CR>")
end
return {{"akinsho/bufferline.nvim", version = "*", dependencies = {"nvim-tree/nvim-web-devicons"}, config = _2_}}
