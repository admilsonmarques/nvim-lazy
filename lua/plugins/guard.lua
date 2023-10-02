-- [nfnl] Compiled from fnl/plugins/guard.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local core = autoload("nfnl.core")
local _local_2_ = require("config.utils")
local augroup = _local_2_["augroup"]
local autocmd = _local_2_["autocmd"]
local lnoremap = _local_2_["lnoremap"]
local function _3_()
  local ft = require("guard.filetype")
  local guard = require("guard")
  ft("python"):fmt("black")
  ft("fennel"):fmt("fnlfmt")
  ft("clojure,edn"):fmt({cmd = "joker", args = {"--format", "-"}, stdin = true, ignore_error = true})
  ft("javascript,typescript,typescriptreact,css,scss,html,json,jsonc,yaml,markdown,graphql"):fmt("prettier", "lint", "eslint")
  ft("scala,sbt"):fmt({cmd = "scalafmt", args = {"--quiet", "--stdin", "--assume-filename"}, stdin = true, fname = true})
  ft("bash,sh,zsh"):fmt("shfmt")
  guard.setup({fmt_on_save = true, lsp_as_default_formatter = false})
  return lnoremap("n", "F", "<cmd>GuardFmt<cr>", "Format")
end
return {{"nvimdev/guard.nvim", dependencies = {"nvimdev/guard-collection"}, config = _3_}}
