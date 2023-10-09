-- [nfnl] Compiled from fnl/plugins/mason.fnl by https://github.com/Olical/nfnl, do not edit.
local opts = {ui = {border = "rounded", icons = {package_installed = "\226\156\147", package_pending = "\226\158\156", package_uninstalled = "\226\156\151"}}, max_concurrent_installers = 10}
local function _1_()
  local mason = require("mason")
  local mason_lspconfig = require("mason-lspconfig")
  mason.setup(opts)
  return mason_lspconfig.setup({})
end
return {{"williamboman/mason-lspconfig.nvim"}, {"williamboman/mason.nvim", dependencies = {"neovim/nvim-lspconfig"}, config = _1_}}
