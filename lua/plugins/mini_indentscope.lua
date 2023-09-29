-- [nfnl] Compiled from fnl/plugins/mini_indentscope.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local core = autoload("nfnl.core")
return {{"echasnovski/mini.indentscope", event = {"BufReadPost", "BufNewFile"}, opts = {symbol = "\226\148\130", options = {try_as_border = true}}, version = false}}
