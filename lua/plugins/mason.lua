-- [nfnl] Compiled from fnl/plugins/mason.fnl by https://github.com/Olical/nfnl, do not edit.
local lspconfig = require("lspconfig")
local function _1_()
  local mason = require("mason")
  local mason_lspconfig = require("mason-lspconfig")
  mason.setup({})
  return mason_lspconfig.setup({})
end
return {{"williamboman/mason-lspconfig.nvim"}, {"williamboman/mason.nvim", dependencies = {"neovim/nvim-lspconfig"}, config = _1_}}
