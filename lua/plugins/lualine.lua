-- [nfnl] Compiled from fnl/plugins/lualine.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local core = autoload("nfnl.core")
local icons = autoload("config.icons")
local colors = autoload("config.colors")
local disable = {"neogitstatus", "netrw", "alpha", "Outline", "NeogitStatus", "NeogitCommitMessage", "NvimTree", "packer", "Trouble", "Outline", "spectre_panel", "TelescopePrompt"}
local ignore = {"help", "packer", "spectre_panel", "TelescopePrompt"}
local function active_clients()
  local clients = vim.lsp.buf_get_clients()
  local client_names = {}
  for _, client in pairs(clients) do
    if (client.name ~= "null-ls") then
      table.insert(client_names, client.name)
    else
    end
  end
  if (#client_names > 0) then
    return table.concat(client_names, ", ")
  else
    return ""
  end
end
local function hide_in_width()
  return (vim.fn.winwidth(0) > 80)
end
local diagnostics = {"diagnostics", sources = {"nvim_diagnostic"}, sections = {"error", "warn"}, symbols = {error = core["get-in"](icons.all, {"diagnostics", "BoldError"}), warn = core["get-in"](icons.all, {"diagnostics", "BoldWarning"})}, colored = true, disabled_buftypes = {"nvim-tree"}, padding = 1, always_visible = true, update_in_insert = false}
local left_separator = core.get(icons.ui, "CircleDividerLeft")
local right_separator = core.get(icons.ui, "CircleDividerRight")
local separators = {left = left_separator, right = right_separator}
local mode = {"mode", separator = {left = left_separator}, right_padding = 0}
local diff = {"diff", symbols = {added = core["get-in"](icons.all, {"git", "LineAdded"}), modified = core["get-in"](icons.all, {"git", "LineModified"}), removed = core["get-in"](icons.all, {"git", "LineRemoved"})}, colored = true, disabled_buftypes = {"nvim-tree"}, separator = separators, cond = hide_in_width}
local branch = {"b:gitsigns_head", icon = (" " .. core.get(icons.git, "Branch")), disabled_buftypes = {"nvim-tree"}, color = {gui = "bold"}, right_padding = 1, separator = separators, cond = hide_in_width}
local filename = {"filename", icon_only = true, disabled_buftypes = {"nvim-tree"}, colored = true, separator = separators, cond = hide_in_width}
local filetype = {"filetype", icon_only = true, disabled_buftypes = {"nvim-tree"}, colored = true, separator = separators, cond = hide_in_width}
local language_server = {active_clients(), disabled_buftypes = {"nvim-tree"}, cond = hide_in_width, separator = separators}
local lsp_progress = {"lsp_progress", display_components = {{"title", "percentage", "message"}}, timer = {progress_enddelay = 500, lsp_client_name_enddelay = 500}, separator = separators}
local sections = {lualine_a = {mode}, lualine_b = {branch, diff}, lualine_c = {diagnostics}, lualine_x = {"filename"}, lualine_y = {filetype, lsp_progress, language_server}, lualine_z = {"location", {"progress", separator = {right = core.get(icons.ui, "CircleDividerRight")}, left_padding = 1}}}
local colors0 = {red = "#ca1243", grey = "#a0a1a7", black = "#383a42", white = "#f3f3f3", light_green = "#83a598", orange = "#fe8019", green = "#8ec07c"}
local function theme(colors1)
  return {normal = {a = {fg = core.get(colors1, "white"), bg = core.get(colors1, "black")}, b = {fg = core.get(colors1, "white"), bg = core.get(colors1, "grey")}, c = {fg = core.get(colors1, "black"), bg = core.get(colors1, "white")}, z = {fg = core.get(colors1, "white"), bg = core.get(colors1, "black")}}, insert = {a = {fg = core.get(colors1, "black"), bg = core.get(colors1, "light_green")}}, visual = {a = {fg = core.get(colors1, "black"), bg = core.get(colors1, "orange")}}, replace = {a = {fg = core.get(colors1, "black"), bg = core.get(colors1, "green")}}}
end
local opts = {options = {icons_enabled = true, theme = "auto", component_separators = "|", section_separators = "", disabled_filetypes = disable, ignore_focus = ignore, always_divide_middle = true, globalstatus = true}, sections = sections, inactive_sections = sections, extensions = {}}
local function _4_()
  local lualine = require("lualine")
  return lualine.setup(opts)
end
return {{"nvim-lualine/lualine.nvim", dependencies = {"lewis6991/gitsigns.nvim"}, priority = 1000, opts = {}, config = _4_, lazy = false}}
