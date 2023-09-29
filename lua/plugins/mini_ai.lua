-- [nfnl] Compiled from fnl/plugins/mini_ai.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  local ai = require("mini.ai")
  return {n_lines = 500, custom_textobjects = {o = ai.gen_spec.treesitter({a = {"@block.outer", "@conditional.outer", "@loop.outer"}, i = {"@block.inner", "@conditional.inner", "@loop.inner"}}, {}), f = ai.gen_spec.treesitter({a = "@function.outer", i = "@function.inner"}, {}), c = ai.gen_spec.treesitter({a = "@class.outer", i = "@class.inner"}, {})}}
end
return {{"echasnovski/mini.ai", dependencies = {"nvim-treesitter-textobjects"}, opts = _1_}}
