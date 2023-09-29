-- [nfnl] Compiled from fnl/plugins/ufo.fnl by https://github.com/Olical/nfnl, do not edit.
local nkeys = {{"<leader>zR", "<cmd>lua require 'config.plugin.ufo'.openAllFolds()<cr>", desc = "Open all Folds"}, {"<leader>zM", "<cmd>lua require 'config.plugin.ufo'.closeAllFolds()<cr>", desc = "Close all Folds"}}
return {{"kevinhwang91/nvim-ufo", keys = nkeys, dependencies = {"kevinhwang91/promise-async"}}}
