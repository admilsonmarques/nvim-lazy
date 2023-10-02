-- [nfnl] Compiled from fnl/plugins/lspconfig.fnl by https://github.com/Olical/nfnl, do not edit.
local vim = vim
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local fun = autoload("config.fun")
local core = autoload("nfnl.core")
local _local_2_ = require("config.utils")
local augroup = _local_2_["augroup"]
local autocmd = _local_2_["autocmd"]
local noremap = _local_2_["noremap"]
local llmap = _local_2_["llmap"]
local buf_keymap = _local_2_["buf_keymap"]
local on_attach = _local_2_["on-attach"]
local function fmt_autocmd(_3_)
  local _arg_4_ = _3_
  local language = _arg_4_["language"]
  local pattern = _arg_4_["pattern"]
  local cmd = _arg_4_["cmd"]
  local group = augroup((language .. "_formatter"), {clear = true})
  return autocmd("BufWritePost", {pattern = pattern, group = group, desc = ("Auto-format " .. language .. " files before saving"), callback = vim.cmd(("!" .. cmd .. " " .. vim.api.nvim_buf_get_name(0)))})
end
local function lsp_binding()
  noremap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>")
  noremap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>")
  noremap("n", "gi", "<Cmd>lua vim.lsp.buf.implementation()<CR>")
  noremap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>")
  llmap("n", "d", "<Cmd>lua vim.lsp.buf.definition()<CR>")
  llmap("n", "D", "<Cmd>lua vim.lsp.buf.declaration()<CR>")
  llmap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>")
  llmap("n", "t", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
  llmap("n", "h", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
  llmap("n", "n", "<cmd>lua vim.lsp.buf.rename()<CR>")
  llmap("n", "e", "<cmd>lua vim.diagnostic.open_float()<CR>")
  llmap("n", "q", "<cmd>lua vim.diagnostic.setloclist()<CR>")
  llmap("n", "f", "<cmd>lua vim.lsp.buf.format()<CR>")
  llmap("n", "j", "<cmd>lua vim.diagnostic.goto_next()<CR>")
  llmap("n", "k", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
  llmap("n", "a", "<cmd>lua vim.lsp.buf.code_action()<CR>")
  llmap("v", "a", "<cmd>lua vim.lsp.buf.range_code_action()<CR> ")
  llmap("n", "w", ":lua require('telescope.builtin').diagnostics()<cr>")
  llmap("n", "r", ":lua require('telescope.builtin').lsp_references()<cr>")
  return llmap("n", "i", ":lua require('telescope.builtin').lsp_implementations()<cr>")
end
local function on_attach0(client, bufnr)
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({group = augroup, buffer = bufnr})
    return vim.cmd("autocmd BufWritePre lua vim.lsp.buf.format()")
  else
    return nil
  end
end
local function _6_()
  local lspconfig = require("lspconfig")
  lspconfig.ansiblels.setup({})
  lspconfig.clangd.setup({})
  lspconfig.clojure_lsp.setup({})
  lspconfig.cssls.setup({})
  lspconfig.dockerls.setup({})
  lspconfig.eslint.setup({})
  lspconfig.fennel_language_server.setup({root_dir = lspconfig.util.root_pattern("fnl", "lua"), settings = {fennel = {diagnostics = {globals = {"vim", "jit", "comment"}}, workspace = {library = vim.api.nvim_list_runtime_paths()}}}})
  lspconfig.pyright.setup({})
  local function _7_(client, bufnr)
    return on_attach0(client, bufnr)
  end
  lspconfig.tsserver.setup({ft = {"tsx", "ts"}, on_attach = _7_})
  return lspconfig.yamlls.setup({})
end
return {{"neovim/nvim-lspconfig", opts = {}, config = _6_}}
