(local {: autoload} (require :nfnl.module))
(local core (autoload :nfnl.core))
(local {: noremap : llmap} (autoload :config.utils))

;; Common ctrl/cmd shortcuts
;; save
(noremap :n :<C-s> ":update!<CR>")
(noremap :i :<C-s> "<ESC>:update!<CR>")

;; Source config
; (noremap :n :<leader><leader> "<cmd>source $MYVIMRC<cr>")

;; Normal ;;
;; jk escape sequences.
(noremap :i :jk :<esc>)
(noremap :c :jk :<c-c>)
(noremap :t :jk "<c-\\><c-n>")

;; Better window navigation
(noremap :n :<C-h> :<C-w>h)
(noremap :n :<C-j> :<C-w>j)
(noremap :n :<C-k> :<C-w>k)
(noremap :n :<C-l> :<C-w>l)

;; Better tab navigation
(noremap :n :<C-S-h> :<cmd>tabprevious<cr>)
;; (noremap :n :<C-S-j> :tabs)
(noremap :n :<C-S-k> :<cmd>tabclose<cr>)
(noremap :n :<C-S-l> :<cmd>tabnext<cr>)

;; Resize with arrows
(noremap :n :<C-Up> ":resize -2<CR>")
(noremap :n :<C-Down> ":resize +2<CR>")
(noremap :n :<C-Left> ":vertical resize -2<CR>")
(noremap :n :<C-Right> ":vertical resize +2<CR>")

;; Visual ;;
;; Stay in indent mode
(noremap :v "<" :<gv)
(noremap :v ">" :>gv)

;; Visual Block ;;
;; Move text up and down
(noremap :x :J ":move '>+1<CR>gv-gv")
(noremap :x :K ":move '<-2<CR>gv-gv")
(noremap :x :<m-j> ":move '>+1<CR>gv-gv")
(noremap :x :<m-k> ":move '<-2<CR>gv-gv")

;; Move text up and down
(noremap :v :<m-j> ":m .+1<CR>==")
(noremap :v :<m-k> ":m .-2<CR>==")
(noremap :v :p "\"_dP")

;; Splits
(noremap :n :<m-s> :<cmd>split<CR>)
(noremap :n :<m-t> :<cmd>vsplit<CR>)

;; Nav
(noremap :n :<m-m> :<cmd>bprev<CR>)
(noremap :n :<m-i> :<cmd>bnext<CR>)

(noremap :n :<c-d> :<c-d>zz)
(noremap :n :<c-u> :<c-u>zz)

(noremap :n :<m-n> :<cmd>nohlsearch<CR>)

(noremap :n :Q "<cmd>:q<CR>")
(noremap :n "-" "<cmd>:Explore<cr>")
