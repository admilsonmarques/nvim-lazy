-- [nfnl] Compiled from fnl/plugins/telekasten.fnl by https://github.com/Olical/nfnl, do not edit.
local home = vim.fn.expand("~/dev/ade/brain")
local opts = {home = home, take_over_my_home = true, auto_set_filetype = true, dailies = (home .. "/" .. "daily"), weeklies = (home .. "/" .. "weekly"), templates = (home .. "/" .. "templates"), image_subdir = "img", extension = ".norg", new_note_filename = "uuid-title", uuid_type = "%Y%m%d%H%M", uuid_sep = "-", follow_creates_nonexisting = true, dailies_create_nonexisting = true, weeklies_create_nonexisting = true, template_new_note = (home .. "/" .. "templates/note.md"), template_new_daily = (home .. "/" .. "templates/daily.md"), template_new_weekly = (home .. "/" .. "templates/weekly.md"), image_link_style = "markdown", sort = "modified", plug_into_calendar = true, calendar_opts = {weeknm = 4, calendar_monday = 1, calendar_mark = "left-fit"}, insert_after_inserting = true, tag_notation = "yaml-bare", command_palette_theme = "dropdown", show_tags_theme = "ivy", subdirs_in_links = true, template_handling = "smart", new_note_location = "smart", rename_update_links = true, vaults = {vault2 = {}}, media_previewer = "viu-previewer", follow_url_fallback = nil, journal_auto_open = false, close_after_yanking = false}
local nkeys = {{"<leader>tf", "<cmd>:Telekasten find_notes<CR>", desc = "Find Notes"}, {"<leader>td", "<cmd>:Telekasten find_daily_notes<CR>", desc = "Find Daily Notes"}, {"<leader>ts", "<cmd>:Telekasten search_notes<CR>", desc = "Grep Notes"}, {"<leader>tz", "<cmd>:Telekasten follow_link<CR>", desc = "Follow Link"}, {"<leader>tT", "<cmd>:Telekasten goto_today<CR><CR>", desc = "Today"}, {"<leader>tW", "<cmd>:Telekasten goto_thisweek<CR>", desc = "This Week"}, {"<leader>tw", "<cmd>:Telekasten find_weekly_notes<CR>", desc = "Find Weekly Notes"}, {"<leader>tn", "<cmd>:Telekasten new_templated_note<CR>", desc = "New Note"}, {"<leader>tc", "<cmd>:Telekasten show_calendar<CR>", desc = "Calendar"}, {"<leader>ti", "<cmd>:Telekasten paste_img_and_link<CR>", desc = "Paste Img"}, {"<leader>tl", "<cmd>:Telekasten insert_link<CR>", desc = "Insert Link"}, {"<leader>ty", "<cmd>:Telekasten yank_notelink<CR>", desc = "Yank Note Link"}, {"<leader>tb", "<cmd>:Telekasten show_backlinks<CR>", desc = "Show Backlinks"}, {"<leader>tF", "<cmd>:Telekasten find_friends<CR>", desc = "Find friends"}, {"<leader>tt", "<cmd>:Telekasten toggle_todo<CR>", desc = "Toggle TODO"}, {"<leader>tp", "<cmd>:Telekasten preview_img<CR>", desc = "Preview Img"}, {"<leader>t#", "<cmd>:Telekasten show_tags<CR>", desc = "Show Tags"}, {"<leader>tm", "<cmd>:MarkdownPreviewToggle<CR>", desc = "Markdown Preview"}, {"<leader>tr", "<cmd>:Telekasten rename_note<CR>", desc = "Rename Note"}}
local ikeys = {{"C-l", "<cmd>:Telekasten insert_link<CR>", desc = "Insert Link"}, {"C-t", "<cmd>:Telekasten toggle_todo<CR>", desc = "Toggle TODO"}}
local function _1_()
  local telekasten = require("telekasten")
  return telekasten.setup(opts)
end
return {{"renerocksai/telekasten.nvim", keys = nkeys, config = _1_, lazy = false}}