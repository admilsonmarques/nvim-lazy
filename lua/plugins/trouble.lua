-- [nfnl] Compiled from fnl/plugins/trouble.fnl by https://github.com/Olical/nfnl, do not edit.
local nkeys = {{"<leader>dd", "<cmd>TroubleToggle<cr>", desc = "Trouble Toggle"}}
return {{"folke/trouble.nvim", dependencies = {"nvim-tree/nvim-web-devicons"}, cmd = {"TroubleToggle", "Trouble"}, keys = nkeys, opts = {use_diagnostic_signs = true}}}
