-- [nfnl] Compiled from fnl/plugins/luasnip.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  local luasnip = require("luasnip")
  local from_vscode = require("luasnip.loaders.from_vscode")
  return from_vscode.lazy_load()
end
return {{"rafamadriz/friendly-snippets"}, {"L3MON4D3/LuaSnip", dependencies = {"rafamadriz/friendly-snippets"}, build = "make install_jsregexp", opts = {history = true, delete_check_events = "TextChanged"}, config = _1_}}
