-- [nfnl] Compiled from fnl/plugins/neorg.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("config.utils")
local autocmd = _local_1_["autocmd"]
local augroup = _local_1_["augroup"]
local brain = "~/dev/ade/brain/"
local function autoload_template(template, group)
  return autocmd("BufNewFile", {pattern = {(brain .. template .. "/*.norg")}, command = ("Neorg templates load " .. template), group = group})
end
local workspaces_configs = {workspaces = {notes = (brain .. "notes"), daily = (brain .. "daily"), weekly = (brain .. "weekly"), work = (brain .. "nubank"), rpg_fim_dos_tempos = (brain .. "rpg/fim-dos-tempos"), templates = (brain .. "templates")}, default_workspace = "notes"}
local opts = {load = {["core.defaults"] = {}, ["core.concealer"] = {config = {icon_preset = "basic"}}, ["core.esupports.metagen"] = {}, ["core.export"] = {}, ["core.export.markdown"] = {}, ["core.qol.toc"] = {}, ["core.qol.todo_items"] = {}, ["core.looking-glass"] = {}, ["core.presenter"] = {config = {zen_mode = "zen-mode"}}, ["core.summary"] = {}, ["core.ui.calendar"] = {}, ["core.journal"] = {config = {strategy = "nested", workspace = "notes"}}, ["core.integrations.telescope"] = {}, ["external.templates"] = {config = {templates_dir = (brain .. "/templates")}}, ["core.dirman"] = {config = workspaces_configs}, ["core.keybinds"] = {config = {default_keybinds = true, neorg_leader = "<leader><leader>"}}}}
local function _2_()
  local neorg = require("neorg")
  local neorg_augroup = augroup("neorg-aucmd", {clear = true})
  return neorg.setup(opts)
end
return {{"folke/zen-mode.nvim"}, {"pysan3/neorg-templates", dependencies = {"L3MON4D3/LuaSnip"}}, {"nvim-neorg/neorg", build = ":Neorg sync-parsers", cmd = "Neorg", dependencies = {"nvim-treesitter/nvim-treesitter", "nvim-lua/plenary.nvim", "nvim-neorg/neorg-telescope", "pysan3/neorg-templates"}, config = _2_}}
