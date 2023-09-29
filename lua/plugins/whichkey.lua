-- [nfnl] Compiled from fnl/plugins/whichkey.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("config.utils")
local opt = _local_1_["opt"]
local _local_2_ = require("nfnl.module")
local autoload = _local_2_["autoload"]
local core = autoload("nfnl.core")
local plugins = {marks = true, registers = true, spelling = {enabled = true, suggestions = 20}, presets = {z = true, g = true, text_objects = false, nav = false, motions = false, windows = false, operators = false}}
local icons = {breadcrumb_separator = "\226\158\156", group_separator = "\226\158\156", separator = "\226\158\156", prompt = "\226\158\156"}
local popup_mappings = {scroll_down = "<c-j>", scroll_up = "<c-k>"}
local window = {border = "single", position = "bottom", margin = {1, 0, 1, 0}, padding = {2, 2, 2, 2}, winblend = 0}
local layout = {height = {min = 4, max = 25}, width = {min = 20, max = 50}, spacing = 3, align = "left"}
local hidden = {"<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}
local opts = {plugins = plugins, icons = icons, popup_mappings = popup_mappings, window = window, layout = layout, hidden = hidden, show_help = true, trigger = "auto", disable = {filetypes = {"netrw"}}, triggers_blacklist = {i = {"j", "k"}, v = {"j", "k"}}, ignore_missing = false}
local nopts = {mode = "n", prefix = "<leader>", buffer = nil, silent = true, noremap = true, nowait = true}
local lsp = {name = "LSP", a = {"<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action"}, f = {"<cmd>lua vim.lsp.buf.format { async = true }<cr>", "Format"}, i = {"<cmd>lua require('telescope.builtin').lsp_implementations()<cr>", "telescope implementations"}, l = {"<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action"}, m = {"<cmd>lua require('telescope').extensions.metals.commands()<CR>", "Metals"}, n = {"<cmd>lua vim.lsp.buf.rename()<cr>", "Rename"}, s = {"<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols"}, S = {"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols"}, d = {"<Cmd>lua vim.lsp.buf.declaration()<CR>", "declaration"}, t = {"<cmd>lua vim.lsp.buf.type_localinition()<CR>", "type_definition"}, h = {"<cmd>lua vim.lsp.buf.signature_help()<CR>", "signature_help"}, e = {"<cmd>lua vim.diagnostic.open_float()<CR>", "diag open_float"}, q = {"<cmd>lua vim.diagnostic.setloclist()<CR>", "diag setloclist"}, k = {"<cmd>lua vim.diagnostic.goto_next()<CR>", "diag goto_next"}, j = {"<cmd>lua vim.diagnostic.goto_prev()<CR>", "diag goto_prev"}, w = {"<cmd>lua require('telescope.builtin').diagnostics()<cr>", "telescope diagnostics"}, r = {"<cmd>lua require('telescope.builtin').lsp_references()<cr>", "telescope references"}}
local nmappings = core.merge({d = {name = "diag"}, q = {"<cmd>bdelete!<CR>", "Close Buffer"}, f = {name = "find"}, g = {name = "git"}, E = {"<cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>", "File Browser"}, r = {name = "replace"}, t = {name = "notes"}, [";"] = {"<cmd>Alpha<cr>", "Dashboard"}, P = {"<CMD>Telescope projects<CR>", "Projects"}, z = {name = "folds"}})
local function _3_()
  opt("timeout", true)
  opt("timeoutlen", 300)
  local wk = require("which-key")
  wk.setup(opts)
  return wk.register(nmappings, nopts)
end
return {{"folke/which-key.nvim", event = "VeryLazy", init = _3_}}
