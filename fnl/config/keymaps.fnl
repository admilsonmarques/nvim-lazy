(local {: noremap : lnoremap} (require :config.utils))

;; Common ctrl/cmd shortcuts
;; save
(noremap :n :<C-s> ":update!<CR>" "Save file")
(noremap :i :<C-s> "<ESC>:update!<CR>" "Save file")

(lnoremap :n :Q "<Cmd>%bd|e#<cr>" "Close all but current buffer")
;; Normal ;;
;; jk escape sequences.
(noremap :i :jk :<esc> "Leave mode")
(noremap :i :<esc> :<esc> "Leave mode")
(noremap :c :jk :<C-c> "Leave mode")
(noremap :t :jk "<C-\\><c-n>" "Leave mode")

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
(noremap :x :<C-j> ":move '>+1<CR>gv-gv")
(noremap :x :<C-k> ":move '<-2<CR>gv-gv")

;; Move text up and down
(noremap :v :<C-j> ":m .+1<CR>==")
(noremap :v :<C-k> ":m .-2<CR>==")
(noremap :v :p "\"_dP")

;; Splits
(noremap :n :<C-S-s> :<cmd>split<CR>)
(noremap :n :<C-S-t> :<cmd>vsplit<CR>)

;; Nav
(noremap :n :<C-m> :<cmd>bprev<CR> "Previous buffer")
(noremap :n :<C-i> :<cmd>bnext<CR> "Next buffer")

(noremap :n :<C-d> :<c-d>zz "Move screen down")
(noremap :n :<C-u> :<c-u>zz "Move screen up")

(lnoremap :n :<C-S-n> :<cmd>nohlsearch<CR> "Clear highlights")

(lnoremap :n :<C-Q> "<cmd>:q<CR>" :Quit)
(noremap :n "-" "<Cmd>:Explore<cr>")
