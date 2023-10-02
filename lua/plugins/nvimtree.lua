-- [nfnl] Compiled from fnl/plugins/nvimtree.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local core = autoload("nfnl.core")
local icons = autoload("config.icons")
local diagnostics = {enable = true, icons = {hint = core["get-in"](icons.all, {"diagnostics", "BoldHint"}), info = core["get-in"](icons.all, {"diagnostics", "BoldInformation"}), warning = core["get-in"](icons.all, {"diagnostics", "BoldWarning"}), error = core["get-in"](icons.all, {"diagnostics", "BoldError"})}, show_on_dirs = false}
local update_focused_file = {enable = true, update_cwd = true, ignore_list = {}}
local system_open = {cmd = nil, args = {}}
local git = {enable = true, timeout = 200, ignore = false}
local mappings_view_list = {{key = {"l", "<CR>", "o"}, action = "edit", mode = "n"}, {key = "h", action = "close_node"}, {key = "v", action = "vsplit"}, {key = "C", action = "cd"}}
local view = {width = 30, side = "left", adaptive_size = true, signcolumn = "yes", relativenumber = false, number = false}
local renderer_indent_markers = {icons = {corner = "\226\148\148", edge = "\226\148\130", item = "\226\148\130", none = " "}, enable = false}
local renderer_icons = {webdev_colors = true, show = {git = true, folder = true, file = true, folder_arrow = true}, glyphs = {default = core["get-in"](icons.all, {"ui", "Text"}), symlink = core["get-in"](icons.all, {"ui", "FileSymlink"}), git = {deleted = core["get-in"](icons.all, {"git", "FileDeleted"}), ignored = core["get-in"](icons.all, {"git", "FileIgnored"}), renamed = core["get-in"](icons.all, {"git", "FileRenamed"}), staged = core["get-in"](icons.all, {"git", "FileStaged"}), unmerged = core["get-in"](icons.all, {"git", "FileUnmerged"}), unstaged = core["get-in"](icons.all, {"git", "FileUnstaged"}), untracked = core["get-in"](icons.all, {"git", "FileUntracked"})}, folder = {default = core["get-in"](icons.all, {"ui", "Fodler"}), empty = core["get-in"](icons.all, {"ui", "EmptyFolder"}), empty_open = core["get-in"](icons.all, {"ui", "EmptyFolderOpen"}), open = core["get-in"](icons.all, {"ui", "FolderOpen"}), symlink = core["get-in"](icons.all, {"ui", "FolderSymlink"})}}}
local renderer = {indent_markers = renderer_indent_markers, icons = renderer_icons, highlight_git = true, root_folder_modifier = ":t", group_empty = false}
local filters = {custom = {"node_modules", "\\.cache"}, exclude = {}, dotfiles = false}
local trash = {cmd = "trash", require_confirm = true}
local log = {types = {all = false, profile = false, copy_paste = false, git = false, diagnostics = false, config = false}, enable = false, truncate = false}
local actions_window_picker = {enable = true, chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890", exclude = {filetype = {"notify", "packer", "qf", "diff", "fugitive", "fugitiveblame"}, buftype = {"nofile", "terminal", "help"}}}
local actions = {use_system_clipboard = true, change_dir = {enable = true, global = true, restrict_above_cwd = false}, open_file = {window_picker = actions_window_picker, resize_window = false, quit_on_open = false}}
local opts = {auto_reload_on_write = true, hijack_directories = {enable = false}, sync_root_with_cwd = true, reload_on_bufenter = true, respect_buf_cwd = true, update_cwd = true, diagnostics = diagnostics, update_focused_file = update_focused_file, system_open = system_open, git = git, view = view, renderer = renderer, filters = filters, trash = trash, log = log, actions = actions}
local keys = {{"<leader>e", "<cmd>NvimTreeToggle<CR>", mode = "n", desc = "NvimTree"}}
return {{"kyazdani42/nvim-tree.lua", version = "*", dependencies = {"nvim-tree/nvim-web-devicons"}, keys = keys, opts = opts, lazy = false}}
