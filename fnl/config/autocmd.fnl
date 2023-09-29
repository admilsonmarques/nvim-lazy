(local {: g
        : opt
        : autocmd} (require :config.utils))



(autocmd
              :BufNewFile
              {:callback (fn []
                           (vim.diagnostic.disable 0))
               :desc "Conjure Log disable LSP diagnostics"
               :group (vim.api.nvim_create_augroup :conjure_log_disable_lsp
                                                   {:clear true})
               :pattern [:conjure-log-*]})



(autocmd
              :FileType
              {:pattern [:qf :help :man :lspinfo]
              :command "nnoremap <silent> <buffer> q :close<CR>"})

(autocmd
              :TextYankPost
              {:callback (lambda []
                           (vim.highlight.on_yank {:higroup :Visual
                                                   :timeout 200}))})

(autocmd :BufWinEnter {:command "setlocal formatoptions-=cro"})

(autocmd :FileType {:pattern :qf :command "set nobuflisted"})

(autocmd :FileType
         {:pattern [:gitcommit :markdown :conjure-log-*]
          :command "setlocal wrap"})

;; (autocmd :TermOpen
;;                 {:pattern ["term://*toggleterm#*"] :command "setlocal spell!"})

(autocmd :VimResized {:command "tabdo wincmd ="})

;Trim trailing white space
(autocmd :BufWritePre
                            {:pattern "*"
                             :command "silent! exec '%s/\\s\\+$/'"})

; ;LSP Format on save
; (autocmd :BufWritePre
;                              {:pattern "*"
;                               :command "lua vim.lsp.buf.format()"})

;Auto pull and push telekasten md files to github
;; (autocmd :BufWritePost
;;                 {:pattern :*.md
;;                  :command "if count(['telekasten'],&filetype)
;;                   | !~/.config/nvim/scripts/gitpush.sh
;;                   | endif
;;                   | redraw!"})

;Auto pull and push pirvate-dots changes to github
;; (autocmd :BufWritePost
;;                 {:pattern "*/private-dots/*"
;;                  :command "!~/.config/nvim/scripts/gitpush.sh
;;                  | redraw!"})
