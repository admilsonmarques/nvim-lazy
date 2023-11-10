-- [nfnl] Compiled from fnl/plugins/lspconfig.fnl by https://github.com/Olical/nfnl, do not edit.
local vim = vim
local _local_1_ = require("config.utils")
local augroup = _local_1_["augroup"]
local autocmd = _local_1_["autocmd"]
local noremap = _local_1_["noremap"]
local llmap = _local_1_["llmap"]
local function lsp_binding()
  noremap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", "Definition")
  llmap("n", "a", "<Cmd>lua vim.lsp.buf.code_action()<CR>", "Action")
  llmap("n", "d", "<Cmd>lua vim.lsp.buf.definition()<CR>", "Definition")
  llmap("n", "l", "<Cmd>lua vim.lsp.buf.document_highlight()<CR>", "Highlights")
  llmap("n", "s", "<Cmd>lua telescope.builtin.treesitter()<CR>", "Symbols")
  llmap("n", "k", "<Cmd>lua vim.lsp.buf.hover()<CR>", "Hover")
  llmap("n", "h", "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature Help")
  llmap("n", "r", "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename")
  llmap("n", "D", "<cmd>lua vim.diagnostic.open_float()<CR>", "Float Diagnostics")
  llmap("n", "f", "<cmd>lua vim.lsp.buf.format()<CR>", "Format")
  llmap("n", "j", "<cmd>lua vim.diagnostic.goto_next()<CR>", "Next Diag")
  llmap("n", "k", "<cmd>lua vim.diagnostic.goto_prev()<CR>", "Prev Diag")
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
local function _3_()
  local lspconfig = require("lspconfig")
  lsp_binding()
  lspconfig.ansiblels.setup({})
  lspconfig.clangd.setup({})
  lspconfig.clojure_lsp.setup({})
  lspconfig.cssls.setup({})
  lspconfig.dockerls.setup({})
  local function _4_(_, bufnr)
    return autocmd("BufWritePre", {buffer = bufnr, command = "EslintFixAll"})
  end
  lspconfig.eslint.setup({on_attach = _4_})
  lspconfig.fennel_language_server.setup({root_dir = lspconfig.util.root_pattern("fnl", "lua"), settings = {fennel = {diagnostics = {globals = {"vim", "jit", "comment"}}, workspace = {library = vim.api.nvim_list_runtime_paths()}}}})
  lspconfig.pyright.setup({})
  local function _5_(client, bufnr)
    return on_attach(client, bufnr)
  end
  lspconfig.tsserver.setup({ft = {"tsx", "ts"}, on_attach = _5_})
  return lspconfig.yamlls.setup({})
end
return {{"neovim/nvim-lspconfig", opts = {}, config = _3_}}
