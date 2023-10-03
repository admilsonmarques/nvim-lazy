-- [nfnl] Compiled from fnl/plugins/statuscol.fnl by https://github.com/Olical/nfnl, do not edit.
local function segments(builtin)
  return {{text = {builtin.foldfunc}, click = "v:lua.ScFa"}, {text = {builtin.lnumfunc, "\226\148\130"}, condition = {true, builtin.not_empty}, click = "v:lua.ScLa"}, {sign = {name = {".*"}, colwidth = 1, maxwidth = 2, wrap = true, auto = true}, text = {"%s"}, click = "v:lua.ScSa"}}
end
local function opts(builtin)
  return {foldfunc = "builtin", setopt = true, separator = " ", relculright = true, segments = segments(builtin), clickmod = "c"}
end
local function _1_()
  local statuscol = require("statuscol")
  local builtin = require("statuscol.builtin")
  return statuscol.setup(opts(builtin))
end
return {{"luukvbaal/statuscol.nvim", config = _1_}}
