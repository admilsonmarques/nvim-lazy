-- [nfnl] Compiled from fnl/plugins/nvimnotify.fnl by https://github.com/Olical/nfnl, do not edit.
local opts = {timeout = 3000, render = "wrapped-compact", max_height = 40, max_width = 60}
local function _1_()
  local notify = require("notify")
  return notify.setup(opts)
end
return {{"rcarriga/nvim-notify", config = _1_}}
