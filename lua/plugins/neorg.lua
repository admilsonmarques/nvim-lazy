-- [nfnl] Compiled from fnl/plugins/neorg.fnl by https://github.com/Olical/nfnl, do not edit.
local brain = "~/dev/ade/brain/"
local workspaces_configs = {workspaces = {notes = (brain .. "notes"), work = (brain .. "nubank"), rpg_fim_dos_tempos = (brain .. "rpg/fim-dos-tempos"), templates = (brain .. "templates")}, default_workspace = "notes"}
local opts = {load = {["core.defaults"] = {}, ["core.concealer"] = {}, ["core.export"] = {}, ["core.export.markdown"] = {}, ["core.presenter"] = {config = {zen_mode = "zen-mode"}}, ["core.summary"] = {}, ["core.ui.calendar"] = {}, ["core.integrations.telescope"] = {}, ["external.templates"] = {config = {templates_dir = (brain .. "/templates")}}, ["core.dirman"] = {config = workspaces_configs}}}
local function _1_()
  local neorg = require("neorg")
  return neorg.setup(opts)
end
return {{"folke/zen-mode.nvim"}, {"pysan3/neorg-templates", dependencies = {"L3MON4D3/LuaSnip"}}, {"nvim-neorg/neorg", build = ":Neorg sync-parsers", dependencies = {"nvim-lua/plenary.nvim", "nvim-neorg/neorg-telescope", "pysan3/neorg-templates"}, config = _1_}}
