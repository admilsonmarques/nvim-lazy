-- [nfnl] Compiled from fnl/plugins/treesitter.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local core = autoload("nfnl.core")
local ensure_installed = {"bash", "c", "clojure", "css", "dockerfile", "fennel", "go", "http", "html", "java", "javascript", "json", "lua", "markdown", "norg", "norg_meta", "python", "rust", "scala", "toml", "vim", "yaml"}
local context_commentstring = {enable = true, config = {typescript = "// %s", css = "/* %s */", scss = "/* %s */", html = "<!-- %s -->", svelte = "<!-- %s -->", vue = "<!-- %s -->", json = ""}, enable_autocmd = false}
local ignore_install = {haskell = "jsonc"}
local opts = {ensure_installed = ensure_installed, highlight = {enable = true, additional_vim_regex_highlighting = false}, indent = {enable = true, disable = {"yaml", "python"}}, ignore_install = ignore_install, autotag = {enable = true}, auto_install = true, incremental_selection = {enable = true}, rainbow = {enable = true, extended_mode = true, max_file_lines = 1000}, additional_vim_regex_highlighting = false}
local function _2_()
  local treesitter = require("nvim-treesitter.configs")
  local parsers = require("nvim-treesitter.parsers")
  local parsers_config = parsers.get_parser_configs()
  treesitter.setup(opts)
  parsers_config.tsx.filetype_to_parsername = {"javascript", "typescript.tsx"}
  return nil
end
local function _3_()
  local commentstring = require("ts_context_commentstring")
  local comment_nvim = commentstring.integrations.comment_nvim()
  do end (vim.g)["skip_ts_context_commentstring_module"] = true
  return comment_nvim.create_pre_hook()
end
return {{"JoosepAlviste/nvim-ts-context-commentstring", lazy = false}, {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate", dependencies = {"nvim-treesitter/nvim-treesitter-textobjects", "JoosepAlviste/nvim-ts-context-commentstring", "p00f/nvim-ts-rainbow"}, config = _2_, lazy = false}, {"numToStr/Comment.nvim", opts = {pre_hook = _3_}, lazy = false}}
