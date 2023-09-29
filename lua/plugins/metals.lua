-- [nfnl] Compiled from fnl/plugins/metals.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("config.utils")
local g = _local_1_["g"]
local opt = _local_1_["opt"]
local autocmd = _local_1_["autocmd"]
local augroup = _local_1_["augroup"]
local function set_settings(metals_config)
  local opts = {superMethodLensesEnabled = true, showImplicitArguments = true, showImplicitConversionsAndClasses = true, showInferredType = true, serverVersion = "latest.snapshot", serverProperties = {"-XX:MaxRAMPercentage=80.0", "-Xss6M", "-XX:-UseGCOverheadLimit", "-XX:+UseG1GC"}, enableSemanticHighlighting = true, excludedPackages = {"akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl"}, javaHome = "/usr/local/homebrew/Cellar/openjdk@8/1.8.0+352"}
  metals_config.settings = opts
  return nil
end
local function set_handlers(metals_config)
  metals_config.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.diagnostic.on_publish_diagnostics, {virtual_text = {preffix = "d"}})
  return nil
end
local function set_capabilities(metals_config)
  local cmp = require("cmo_nvim_lsp")
  local default_capabilities = cmp.default_capabilities()
  metals_config.capabilities = default_capabilities
  return nil
end
local function set_autocmd()
  return autocmd("FileType", {desc = "Enable Telescope Metals Extension", pattern = {"scala", "sbt"}, command = "lua require('telescope').extensions.metals.commands()"})
end
local function metals_setup(metals, metals_config)
  local cmp = require("cmo_nvim_lsp")
  set_settings(metals_config)
  set_handlers(metals_config)
  set_capabilities(metals_config)
  set_autocmd()
  metals_config.init_options.statusBarProvider = "on"
  vim.cmd("\n               hi! link LspCodeLens       CursorColumn\n               hi! link LspReferenceText  CursorColumn\n               hi! link LspReferenceRead  CursorColumn\n               hi! link LspReferenceWrite CursorColumn\n               ")
  return metals_config
end
local function _2_()
  local metals = require("metals")
  local metals_config = metals.bare_config()
  local nvim_metals_group = augroup("nvim-metals", {clear = true})
  local function _3_()
    return metals.initialize_or_attach(metals_setup(metals, metals_config))
  end
  return autocmd("FileType", {desc = "Initialize metals", pattern = {"scala", "sbt"}, callback = _3_, group = nvim_metals_group})
end
return {{"scalameta/nvim-metals", dependencies = {"nvim-lua/plenary.nvim", "nvim-lua/popup.nvim", "hrsh7th/cmp-nvim-lsp"}, config = _2_}}
