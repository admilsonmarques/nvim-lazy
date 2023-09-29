-- [nfnl] Compiled from fnl/config/autocmd.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("config.utils")
local g = _local_1_["g"]
local opt = _local_1_["opt"]
local autocmd = _local_1_["autocmd"]
local function _2_()
  return vim.diagnostic.disable(0)
end
autocmd("BufNewFile", {callback = _2_, desc = "Conjure Log disable LSP diagnostics", group = vim.api.nvim_create_augroup("conjure_log_disable_lsp", {clear = true}), pattern = {"conjure-log-*"}})
autocmd("FileType", {pattern = {"qf", "help", "man", "lspinfo"}, command = "nnoremap <silent> <buffer> q :close<CR>"})
local function _3_()
  return vim.highlight.on_yank({higroup = "Visual", timeout = 200})
end
autocmd("TextYankPost", {callback = _3_})
autocmd("BufWinEnter", {command = "setlocal formatoptions-=cro"})
autocmd("FileType", {pattern = "qf", command = "set nobuflisted"})
autocmd("FileType", {pattern = {"gitcommit", "markdown", "conjure-log-*"}, command = "setlocal wrap"})
autocmd("VimResized", {command = "tabdo wincmd ="})
return autocmd("BufWritePre", {pattern = "*", command = "silent! exec '%s/\\s\\+$/'"})
