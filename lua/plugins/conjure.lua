-- [nfnl] Compiled from fnl/plugins/conjure.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("config.utils")
local g = _local_1_["g"]
local opt = _local_1_["opt"]
local autocmd = _local_1_["autocmd"]
local function _2_()
  g("conjure#eval#result_register", "*")
  g("conjure#log#botright", true)
  g("conjure#mapping#doc_word", "K")
  g("conjure#log#strip_ansi_escape_sequences_line_limit", 0)
  g("conjure#extract#tree_sitter#enabled", true)
  g("conjure#client#clojure#nrepl#connection#auto_repl#enabled", true)
  g("conjure#client#clojure#nrepl#connection#auto_repl#hidden", false)
  g("conjure#client#clojure#nrepl#connection#auto_repl#cmd", "Lein!")
  g("conjure#client#clojure#nrepl#eval#auto_require", true)
  g("conjure#client#clojure#nrepl#test#current_form_names", {"deftest", "defflow"})
  g("conjure#extract#tree_sitter#enabled", true)
  g("conjure#eval#result_register", "e")
  g("conjure#mapping#eval_root_form", "ef")
  g("conjure#mapping#eval_comment_root_form", "e;")
  g("conjure#mapping#eval_file", "el")
  g("conjure#log#hud#width", 1)
  g("conjure#log#hud#enabled", false)
  g("conjure#log#hud#height", 0.2)
  g("conjure#log#hud#anchor", "SE")
  g("conjure#log#botright", true)
  g("conjure#log#wrap", true)
  g("conjure#log#fold#enabled", false)
  g("conjure#extract#context_header_lines", 100)
  g("conjure#highlight#enabled", true)
  g("conjure#client#fennel#aniseed#aniseed_module_prefix", "aniseed.")
  local function _3_()
    return vim.diagnostic.disable(0)
  end
  autocmd("BufNewFile", {desc = "Conjure Log disable LSP diagnostics", callback = _3_, group = vim.api.nvim_create_augroup("conjure_log_disable_lsp", {clear = true}), pattern = {"conjure-log-*"}})
  local function _4_()
    vim.bo.commentstring = ";; %s"
    return nil
  end
  autocmd("FileType", {desc = "Lisp style line comment", callback = _4_, group = vim.api.nvim_create_augroup("comment_config", {clear = true}), pattern = {"clojure"}})
  autocmd("FileType", {desc = "Jack-in Lein and Conjure", pattern = {"clojure"}, command = "nnoremap <silent> <localleader>cc <cmd>Lein!<cr><bar><cmd>ConjureLogVSplit<cr><bar><cmd>ConjureConnect<cr>"})
  autocmd("FileType", {pattern = {"clojure", "fennel", "scheme"}, command = "nnoremap <silent> gd <cmd>ConjureDefWord<CR>"})
  autocmd("FileType", {pattern = {"clojure", "fennel", "scheme"}, command = "nnoremap <silent> <c-]> <cmd>ConjureDefWord<CR>"})
  autocmd("FileType", {pattern = {"clojure", "fennel", "scheme"}, command = "nnoremap <silent> K <cmd>ConjureDocWord<CR>"})
  return autocmd("FileType", {pattern = {"clojure", "fennel", "scheme"}, command = "nnoremap <silent> gD <cmd>ConjureCljViewSource<CR>"})
end
return {{"Olical/conjure", ft = {"clojure", "fennel", "clj"}, init = _2_}}
