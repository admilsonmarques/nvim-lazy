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
local function lsp_binding()
  noremap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>")
  noremap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>")
  noremap("n", "gi", "<Cmd>lua vim.lsp.buf.implementation()<CR>")
  noremap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>")
  llmap("n", "d", "<Cmd>lua vim.lsp.buf.definition()<CR>", "Definition")
  llmap("n", "D", "<Cmd>lua vim.lsp.buf.declaration()<CR>", "Declaration")
  llmap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", "Hover")
  llmap("n", "t", "<cmd>lua vim.lsp.buf.type_definition()<CR>", "TypeDefinition")
  llmap("n", "h", "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature Help")
  llmap("n", "n", "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename")
  llmap("n", "e", "<cmd>lua vim.diagnostic.open_float()<CR>", "Float Diagnostics")
  llmap("n", "q", "<cmd>lua vim.diagnostic.setloclist()<CR>")
  llmap("n", "f", "<cmd>lua vim.lsp.buf.format()<CR>", "Format")
  llmap("n", "j", "<cmd>lua vim.diagnostic.goto_next()<CR>", "Next Diag")
  llmap("n", "k", "<cmd>lua vim.diagnostic.goto_prev()<CR>", "Prev Diag")
  llmap("n", "a", "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action")
  llmap("v", "a", "<cmd>lua vim.lsp.buf.range_code_action()<CR> ", "Range Code Action")
  llmap("n", "w", ":lua require('telescope.builtin').diagnostics()<cr>", "Telescope Diag")
  llmap("n", "r", ":lua require('telescope.builtin').lsp_references()<cr>", "Telescope References")
  return llmap("n", "i", ":lua require('telescope.builtin').lsp_implementations()<cr>", "Telescope Implementations")
end
local function on_attach(client, bufnr)
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({group = augroup, buffer = bufnr})
    return vim.cmd("autocmd BufWritePre lua vim.lsp.buf.format()")
  else
    return nil
  end
end
local function _4_()
  local lspconfig = require("lspconfig")
  lsp_binding()
  lspconfig.ansiblels.setup({})
  lspconfig.clangd.setup({})
  lspconfig.clojure_lsp.setup({})
  lspconfig.cssls.setup({})
  lspconfig.dockerls.setup({})
  local function _5_(_, bufnr)
    return autocmd("BufWritePre", {buffer = bufnr, command = "EslintFixAll"})
  end
  lspconfig.eslint.setup({on_attach = _5_})
  lspconfig.fennel_language_server.setup({root_dir = lspconfig.util.root_pattern("fnl", "lua"), settings = {fennel = {diagnostics = {globals = {"vim", "jit", "comment"}}, workspace = {library = vim.api.nvim_list_runtime_paths()}}}})
  lspconfig.metals.setup({})
  lspconfig.pyright.setup({})
  local function _6_(client, bufnr)
    return on_attach(client, bufnr)
  end
  lspconfig.tsserver.setup({ft = {"tsx", "ts"}, on_attach = _6_})
  return lspconfig.yamlls.setup({})
end
return {{"neovim/nvim-lspconfig", opts = {}, config = _4_}}
