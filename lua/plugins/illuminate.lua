-- [nfnl] Compiled from fnl/plugins/illuminate.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_(_, opts)
  local illuminate = require("illuminate")
  return illuminate.configure(opts)
end
return {{"RRethy/vim-illuminate", event = {"BufReadPost", "BufNewFile"}, opts = {delay = 200, large_file_cutoff = 2000, large_files_override = {providers = {"lsp"}}}, config = _1_}}
