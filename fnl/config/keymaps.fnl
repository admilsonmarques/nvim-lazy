(local {: autoload} (require :nfnl.module))
(local core (autoload :nfnl.core))
(local utils (autoload :config.utils))

(fn map [mode from to] (utils.noremap mode from to))
;TODO asdas
;HACK abc

;;Remap space as leader key
; (map :n :<leader> "<cmd>WhichKey <leader> ''<CR>" )
;(set nvim.g.mapleader " ")
;(set nvim.g.maplocalleader ",")

;; Reload Config
; (global map_functions {:aniseed_reload aniseed-reload})
; (utils.lnoremap :n :<leader> "<cmd>lua map_functions.aniseed_reload()<cr>")

;; Common ctrl/cmd shortcuts
;; save
(map :n :<C-s> ":update!<CR>")
(map :i :<C-s> "<ESC>:update!<CR>")

;; Source config
; (map :n :<leader><leader> "<cmd>source $MYVIMRC<cr>")

;; Normal ;;
;; jk escape sequences.
(map :i :jk :<esc>)
(map :c :jk :<c-c>)
(map :t :jk "<c-\\><c-n>")

;; Better window navigation
(map :n :<C-h> :<C-w>h)
(map :n :<C-j> :<C-w>j)
(map :n :<C-k> :<C-w>k)
(map :n :<C-l> :<C-w>l)

;; Better tab navigation
(map :n :<C-S-h> :<cmd>tabprevious<cr>)
;; (map :n :<C-S-j> :tabs)
(map :n :<C-S-k> :<cmd>tabclose<cr>)
(map :n :<C-S-l> :<cmd>tabnext<cr>)

;; Resize with arrows
(map :n :<C-Up> ":resize -2<CR>")
(map :n :<C-Down> ":resize +2<CR>")
(map :n :<C-Left> ":vertical resize -2<CR>")
(map :n :<C-Right> ":vertical resize +2<CR>")

;; Visual ;;
;; Stay in indent mode
(map :v "<" :<gv)
(map :v ">" :>gv)

;; Visual Block ;;
;; Move text up and down
(map :x :J ":move '>+1<CR>gv-gv")
(map :x :K ":move '<-2<CR>gv-gv")
(map :x :<m-j> ":move '>+1<CR>gv-gv")
(map :x :<m-k> ":move '<-2<CR>gv-gv")

;; Move text up and down
(map :v :<m-j> ":m .+1<CR>==")
(map :v :<m-k> ":m .-2<CR>==")
(map :v :p "\"_dP")

;; Splits
(map :n :<m-s> :<cmd>split<CR>)
(map :n :<m-t> :<cmd>vsplit<CR>)

;; Nav
(map :n :<m-m> :<cmd>bprev<CR>)
(map :n :<m-i> :<cmd>bnext<CR>)

(map :n :<c-d> :<c-d>zz)
(map :n :<c-u> :<c-u>zz)

(map :n :<m-n> :<cmd>nohlsearch<CR>)

(map :n :Q "<cmd>:q<CR>")
(map :n "-" "<cmd>:Explore<cr>")

;LSP
(map :n :gd "<Cmd>lua vim.lsp.buf.definition()<CR>")
(map :n :gD "<Cmd>lua vim.lsp.buf.declaration()<CR>")
(map :n :gi "<Cmd>lua vim.lsp.buf.implementation()<CR>")
(map :n :K "<Cmd>lua vim.lsp.buf.hover()<CR>")
