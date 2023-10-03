-- [nfnl] Compiled from fnl/plugins/gitsigns.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local core = autoload("nfnl.core")
local icons = autoload("config.icons")
local signs = {add = {hl = "GitSignsAdd", text = core.get(icons.git, "LineGeneral"), numhl = "GitSignsAddNr", linehl = "GitSignsAddLn"}, change = {hl = "GitSignsChange", text = core.get(icons.git, "LineGeneral"), numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn"}, delete = {hl = "GitSignsDelete", text = core.get(icons.git, "LineGeneral"), numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn"}, topdelete = {hl = "GitSignsDelete", text = core.get(icons.git, "LineGeneral"), numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn"}, changedelete = {hl = "GitSignsChange", text = core.get(icons.git, "LineGeneral"), numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn"}}
local opts = {signs = signs, signcolumn = true, watch_gitdir = {interval = 100, follow_files = true}, attach_to_untracked = true, current_line_blame = true, current_line_blame_opts = {virt_text = true, virt_text_pos = "eol", delay = 100, ignore_whitespace = true}, current_line_blame_formatter_opts = {relative_time = false}, sign_priority = 6, update_debounce = 100, status_formatter = nil, max_file_length = 40000, preview_config = {border = "single", style = "minimal", relative = "cursor", row = 0, col = 1}, yadm = {enable = false}, word_diff = false, linehl = false, numhl = false}
local nkeys = {{"<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk()<cr>", desc = "Next Hunk"}, {"<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", desc = "Prev Hunk"}, {"<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>", desc = "Blame"}, {"<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", desc = "Preview Hunk"}, {"<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", desc = "Reset Hunk"}, {"<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", desc = "Reset Buffer"}, {"<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", desc = "Stage Hunk"}, {"<leader>gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", desc = "Undo Stage Hunk"}, {"<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", desc = "Diff"}}
local function _2_()
  local gitsigns = require("gitsigns")
  return gitsigns.setup(opts)
end
return {{"lewis6991/gitsigns.nvim", event = {"BufReadPost", "BufNewFile"}, keys = nkeys, config = _2_}}
