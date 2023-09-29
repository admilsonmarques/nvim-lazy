-- [nfnl] Compiled from fnl/plugins/toggleterm.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local core = autoload("nfnl.core")
local float_opts = {border = "curved", winblend = 0}
local execs = {{nil, "<M-1>", "Horizontal Terminal", "horizontal", 0.3}, {nil, "<M-2>", "Vertical Terminal", "vertical", 0.4}, {nil, "<M-3>", "Float Terminal", "float", nil}}
local opts = {size = 20, open_mapping = "<C-\\>", hide_numbers = true, shade_filetypes = {}, start_in_insert = true, insert_mappings = true, direction = "float", float_opts = float_opts, execs = execs, shell = vim.o.shell, close_on_exit = true, shade_terminals = false, persist_size = false}
local function gen_term_app(cmd)
  local toggleterm = require("toggleterm")
  local Terminal = toggleterm.terminal.Terminal
  local app
  local function _2_(_)
    return vim.cmd("startinsert!")
  end
  local function _3_(_)
  end
  app = Terminal:new({cmd = cmd, hidden = true, hide_numbers = true, direction = "float", float_opts = float_opts, on_open = _2_, on_close = _3_, count = 99, close_on_exit = true})
  return app:toggle()
end
local function lazygit()
  return gen_term_app("lazygit")
end
local function spt()
  return gen_term_app("spt")
end
local nkeys = {}
local tkeys = {{"<C-h>", "<Cmd>wincmd h<CR>", desc = "Move to the left window", mode = "t"}, {"<C-j>", "<Cmd>wincmd j<CR>", desc = "Move to the below window", mode = "t"}, {"<C-k>", "<Cmd>wincmd k<CR>", desc = "Move to the above window", mode = "t"}, {"<C-l>", "<Cmd>wincmd l<CR>", desc = "Move to the right window", mode = "t"}}
return {{"akinsho/toggleterm.nvim", version = "*", keys = core.merge(nkeys, tkeys), opts = opts, lazy = false}}
