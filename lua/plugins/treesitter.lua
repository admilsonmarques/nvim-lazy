-- [nfnl] Compiled from fnl/plugins/treesitter.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local core = autoload("nfnl.core")
local ensure_installed = {"bash", "c", "clojure", "css", "dockerfile", "fennel", "go", "http", "html", "java", "javascript", "json", "lua", "markdown", "norg", "norg_meta", "python", "rust", "scala", "typescript", "vim", "yaml"}
local context_commentstring = {enable = true, config = {typescript = "// %s", css = "/* %s */", scss = "/* %s */", html = "<!-- %s -->", svelte = "<!-- %s -->", vue = "<!-- %s -->", json = ""}, enable_autocmd = false}
local ignore_install = {haskell = "jsonc"}
local opts = {ensure_installed = ensure_installed, context_commentstring = context_commentstring, highlight = {enable = true, additional_vim_regex_highlighting = false}, indent = {enable = true, disable = {"yaml", "python"}}, ignore_install = ignore_install, auto_install = true, incremental_selection = {enable = true}, rainbow = {enable = true, extended_mode = true, max_file_lines = 1000}}
local function commentstring_opts(commentstring)
  return {active = true, padding = true, sticky = true, ignore = "^$", mappings = {basic = true, extra = true}, toggler = {line = "gcc", block = "gbc"}, opleader = {line = "gc", block = "gb"}, extra = {above = "gcO", below = "gco", eol = "gcA"}, pre_hook = commentstring.create_pre_hook(), post_hoot = nil}
end
local function _2_()
  local treesitter = require("nvim-treesitter.configs")
  return treesitter.setup(opts)
end
local function _3_()
  local commentstring = require("ts_context_commentstring.integrations.comment_nvim")
  return commentstring_opts(commentstring)
end
return {{"JoosepAlviste/nvim-ts-context-commentstring", lazy = false}, {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate", dependencies = {"nvim-treesitter/nvim-treesitter-textobjects", "JoosepAlviste/nvim-ts-context-commentstring", "p00f/nvim-ts-rainbow"}, config = _2_, lazy = false}, {"numToStr/Comment.nvim", opts = _3_, lazy = false}}
