-- [nfnl] Compiled from fnl/plugins/lspconfig.fnl by https://github.com/Olical/nfnl, do not edit.
local vim = vim
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local fun = autoload("config.fun")
local core = autoload("nfnl.core")
local _local_2_ = require("config.utils")
local augroup = _local_2_["augroup"]
local autocmd = _local_2_["autocmd"]
local buf_keymap = _local_2_["buf_keymap"]
local on_attach = _local_2_["on-attach"]
local function fmt_autocmd(_3_)
  local _arg_4_ = _3_
  local language = _arg_4_["language"]
  local pattern = _arg_4_["pattern"]
  local cmd = _arg_4_["cmd"]
  local group = augroup((language .. "_formatter"), {clear = true})
  return autocmd("BufWritePre", {pattern = pattern, group = group, desc = ("Auto-format " .. language .. " files before saving"), callback = vim.cmd(("!" .. cmd .. " " .. vim.api.nvim_buf_get_name(0)))})
end
local set_keymaps
local function _5_(client, bufnr)
  buf_keymap(bufnr, "n", "<localleader>d", "<Cmd>lua vim.lsp.buf.definition()<CR>")
  buf_keymap(bufnr, "n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>")
  buf_keymap(bufnr, "n", "<localleader>D", "<Cmd>lua vim.lsp.buf.declaration()<CR>")
  buf_keymap(bufnr, "n", "<localleader>t", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
  buf_keymap(bufnr, "n", "<localleader>h", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
  buf_keymap(bufnr, "n", "<localleader>n", "<cmd>lua vim.lsp.buf.rename()<CR>")
  buf_keymap(bufnr, "n", "<localleader>e", "<cmd>lua vim.diagnostic.open_float()<CR>")
  buf_keymap(bufnr, "n", "<localleader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>")
  buf_keymap(bufnr, "n", "<localleader>f", "<cmd>lua vim.lsp.buf.format()<CR>")
  buf_keymap(bufnr, "n", "<localleader>j", "<cmd>lua vim.diagnostic.goto_next()<CR>")
  buf_keymap(bufnr, "n", "<localleader>k", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
  buf_keymap(bufnr, "n", "<localleader>a", "<cmd>lua vim.lsp.buf.code_action()<CR>")
  buf_keymap(bufnr, "v", "<localleader>a", "<cmd>lua vim.lsp.buf.range_code_action()<CR> ")
  buf_keymap(bufnr, "n", "<localleader>w", ":lua require('telescope.builtin').diagnostics()<cr>")
  buf_keymap(bufnr, "n", "<localleader>r", ":lua require('telescope.builtin').lsp_references()<cr>")
  buf_keymap(bufnr, "n", "<localleader>i", ":lua require('telescope.builtin').lsp_implementations()<cr>")
  client.server_capabilities.document_formatting = false
  client.server_capabilities.document_range_formatting = false
  return nil
end
set_keymaps = _5_
local function _6_()
  local lspconfig = require("lspconfig")
  lspconfig.ansiblels.setup({})
  lspconfig.clangd.setup({})
  lspconfig.clojure_lsp.setup({})
  lspconfig.cssls.setup({})
  lspconfig.dockerls.setup({})
  local function _7_(client, bufnr)
    return autocmd("BufWritePre", {buffer = bufnr, command = "EslintFixAll"})
  end
  lspconfig.eslint.setup({on_attach = _7_})
  local function _8_()
    return fmt_autocmd({language = "Fennel", pattern = "*.fnl", cmd = "fnlfmt --fix"})
  end
  lspconfig.fennel_language_server.setup({root_dir = lspconfig.util.root_pattern("fnl", "lua"), settings = {fennel = {diagnostics = {globals = {"vim", "jit", "comment"}}, workspace = {library = vim.api.nvim_list_runtime_paths()}}}, on_attach = _8_})
  lspconfig.pyright.setup({})
  lspconfig.tsserver.setup({})
  return lspconfig.yamlls.setup({})
end
return {{"neovim/nvim-lspconfig", opts = {}, config = _6_}}
