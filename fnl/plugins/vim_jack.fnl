(local {: g
        : opt
        : autocmd} (require :config.utils))

[{1 :clojure-vim/vim-jack-in
  :ft :clojure
  :cmd :Lein
  :dependencies [:tpope/vim-dispatch
                 :radenling/vim-dispatch-neovim]
  ; :init (fn []
  ;         (autocmd :FileType
  ;                            {:desc "Start Lein repl"
  ;                             :pattern [:clojure]
  ;                             :command "Lein!"}))
 }]
