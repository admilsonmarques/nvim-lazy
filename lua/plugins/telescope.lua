-- [nfnl] Compiled from fnl/plugins/telescope.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local core = autoload("nfnl.core")
local function opts(themes)
  local grep_actions = require("telescope-live-grep-args.actions")
  return {defaults = {file_ignore_patterns = {"node_modules"}}, extensions = {["ui-select"] = {themes.get_dropdown()}, live_grep_args = {auto_quoting = true, mappings = {i = {["<C-k>"] = grep_actions.quote_prompt(), ["<C-i>"] = grep_actions.quote_prompt({postfix = " --iglob "})}}}}, pickers = {find_files = {find_command = {"rg", "--files", "--iglob", "!.git", "--hidden"}}}}
end
local nkeys = {{"<leader>fb", "<cmd>Telescope git_branches theme=dropdown<cr>", desc = "Checkout branch"}, {"<leader>fc", "<cmd>Telescope colorscheme theme=dropdown<cr>", desc = "Colorscheme"}, {"<leader>ff", "<cmd>Telescope find_files theme=dropdown<cr>", desc = "Find files"}, {"<leader>ft", "<cmd>Telescope live_grep theme=ivy<cr>", desc = "Find text"}, {"<leader>fS", "<cmd>Telescope grep_string theme=dropdown<cr>", desc = "Find String"}, {"<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help"}, {"<leader>fH", "<cmd>Telescope highlights<cr>", desc = "Highlights"}, {"<leader>fl", "<cmd>Telescope resume<cr>", desc = "Last Search"}, {"<leader>fp", "<CMD>Telescope projects<CR>", desc = "Projects"}, {"<leader>fr", "<cmd>Telescope oldfiles theme=dropdown<cr>", desc = "Recent File"}, {"<leader>fR", "<cmd>Telescope registers<cr>", desc = "Registers"}, {"<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps"}, {"<leader>fC", "<cmd>Telescope commands<cr>", desc = "Commands"}, {"<leader>go", "<cmd>Telescope git_status theme=dropdown<cr>", desc = "Open changed file"}, {"<leader>gb", "<cmd>Telescope git_branches theme=dropdown<cr>", desc = "Checkout branch"}, {"<leader>gc", "<cmd>Telescope git_commits theme=dropdown<cr>", desc = "Checkout commit"}, {"<leader>dD", "<cmd>Telescope diagnostics theme=dropdown<cr>", desc = "Telescope diagnostics"}}
local keys = core.merge(nkeys, {})
local function _2_()
  local telescope = require("telescope")
  local themes = require("telescope.themes")
  telescope.setup(opts(themes))
  telescope.load_extension("ui-select")
  telescope.load_extension("emoji")
  telescope.load_extension("projects")
  telescope.load_extension("file_browser")
  telescope.load_extension("live_grep_args")
  return telescope.load_extension("fzf")
end
return {{"nvim-telescope/telescope-fzf-native.nvim", build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"}, {"nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = {"nvim-lua/plenary.nvim", "nvim-telescope/telescope-ui-select.nvim", "nvim-telescope/telescope-file-browser.nvim", "nvim-telescope/telescope-live-grep-args.nvim", "nvim-lua/popup.nvim", "ahmedkhalf/project.nvim", "xiyaowong/telescope-emoji.nvim", "nvim-telescope/telescope-fzf-native.nvim", "nvim-telescope/telescope-symbols.nvim"}, keys = keys, config = _2_, lazy = false}}
