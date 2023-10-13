-- [nfnl] Compiled from fnl/plugins/metals.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("config.utils")
local autocmd = _local_1_["autocmd"]
local augroup = _local_1_["augroup"]
local llmap = _local_1_["llmap"]
local function status_handler(err, status, ctx)
  local text = (status.text):gsub("[\226\160\135\226\160\139\226\160\153\226\160\184\226\160\180\226\160\166]", ""):gsub("^%s*(.-)%s*$", "%1")
  local msg_val
  if status.hide then
    msg_val = {kind = "end"}
  elseif status.show then
    msg_val = {kind = "begin", title = text}
  elseif status.text then
    msg_val = {kind = "report", message = text}
  else
    msg_val = nil
  end
  local info = {client_id = ctx.client_id}
  local msg = {token = "metals", value = msg_val}
  if msg.value then
    return vim.lsp.handlers["$/progress"](err, msg, ctx)
  else
    return nil
  end
end
local function bindings()
  llmap("n", "I", "<cmd>lua require'metals'.organize_imports()<cr>", "Metals - Organize Imports")
  return llmap("n", "m", "<cmd>lua require'telescope'.extensions.metals.commands()<cr>", "Metals - menu")
end
local function _4_()
  local metals = require("metals")
  local metals_config = metals.bare_config()
  local nvim_metals_group = augroup("nvim-metals", {clear = true})
  do end (metals_config)["handlers"] = {["metals/status"] = status_handler}
  metals_config.init_options["statusBarProvider"] = "on"
  metals_config["settings"] = {showImplicitArguments = true, showImplicitConversionsAndClasses = true, showInferredType = true, serverVersion = "latest.snapshot", scalafixRulesDependencies = {"com.github.liancheng/scalafix-rules-dotty:0.1.6"}, serverProperties = {"-XX:+UseStringDeduplication", "-XX:MaxInlineLevel=20", "-XX:+UseParallelGC", "-Xmx10G", "-Xms2G"}, enableSemanticHighlighting = false}
  do end (require("cmp_nvim_lsp")).default_capabilities()
  local function _5_(client, bufnr)
    return metals.setup_dap()
  end
  metals_config["on_attach"] = _5_
  bindings()
  local function _6_()
    return metals.initialize_or_attach(metals_config)
  end
  return autocmd("FileType", {pattern = {"scala", "sbt", "sc"}, callback = _6_, group = nvim_metals_group})
end
return {{"scalameta/nvim-metals", dependencies = {"nvim-lua/plenary.nvim", "mfussenegger/nvim-dap", "nvim-lua/popup.nvim", "hrsh7th/cmp-nvim-lsp"}, config = _4_}}
