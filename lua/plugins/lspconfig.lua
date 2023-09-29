-- [nfnl] Compiled from fnl/plugins/lspconfig.fnl by https://github.com/Olical/nfnl, do not edit.
local vim = vim
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local fun = autoload("config.fun")
local core = autoload("nfnl.core")
local _local_2_ = require("config.utils")
local augroup = _local_2_["augroup"]
local autocmd = _local_2_["autocmd"]
local fmt_autocmd = _local_2_["fmt-autocmd"]
local buf_keymap = _local_2_["buf_keymap"]
local on_attach = _local_2_["on-attach"]
local fmt_group = augroup("lsp-formatters", {clear = true})
local teste = "abc"
local on_attach0
local function _3_(client, bufnr)
  buf_keymap(bufnr, "n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>")
  buf_keymap(bufnr, "n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>")
  buf_keymap(bufnr, "n", "<leader>ld", "<Cmd>lua vim.lsp.buf.declaration()<CR>")
  buf_keymap(bufnr, "n", "<leader>lt", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
  buf_keymap(bufnr, "n", "<leader>lh", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
  buf_keymap(bufnr, "n", "<leader>ln", "<cmd>lua vim.lsp.buf.rename()<CR>")
  buf_keymap(bufnr, "n", "<leader>le", "<cmd>lua vim.diagnostic.open_float()<CR>")
  buf_keymap(bufnr, "n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>")
  buf_keymap(bufnr, "n", "<leader>lf", "<cmd>lua vim.lsp.buf.format()<CR>")
  buf_keymap(bufnr, "n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<CR>")
  buf_keymap(bufnr, "n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
  buf_keymap(bufnr, "n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>")
  buf_keymap(bufnr, "v", "<leader>la", "<cmd>lua vim.lsp.buf.range_code_action()<CR> ")
  buf_keymap(bufnr, "n", "<leader>lw", ":lua require('telescope.builtin').diagnostics()<cr>")
  buf_keymap(bufnr, "n", "<leader>lr", ":lua require('telescope.builtin').lsp_references()<cr>")
  buf_keymap(bufnr, "n", "<leader>li", ":lua require('telescope.builtin').lsp_implementations()<cr>")
  client.server_capabilities.document_formatting = false
  client.server_capabilities.document_range_formatting = false
  return nil
end
on_attach0 = _3_
local function _4_()
  local lspconfig = require("lspconfig")
  lspconfig.ansiblels.setup({})
  lspconfig.clangd.setup({})
  lspconfig.clojure_lsp.setup({})
  lspconfig.dockerls.setup({})
  local function _5_(_, bufnr)
    return autocmd("BufWritePre", {buffer = bufnr, command = "EslintFixAll"})
  end
  lspconfig.eslint.setup({on_attach = _5_})
  lspconfig.fennel_language_server.setup({root_dir = lspconfig.util.root_pattern("fnl", "lua"), settings = {fennel = {diagnostics = {globals = {"vim", "jit", "comment"}}, workspace = {library = vim.api.nvim_list_runtime_paths()}}}})
  lspconfig.pyright.setup({})
  lspconfig.tsserver.setup({})
  return lspconfig.yamlls.setup({})
end
return {{"neovim/nvim-lspconfig", opts = {}, config = _4_}}
