-- [nfnl] Compiled from fnl/plugins/vim_jack.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("config.utils")
local g = _local_1_["g"]
local opt = _local_1_["opt"]
local autocmd = _local_1_["autocmd"]
return {{"clojure-vim/vim-jack-in", ft = "clojure", cmd = "Lein", dependencies = {"tpope/vim-dispatch", "radenling/vim-dispatch-neovim"}}}
