(local {: autoload} (require :nfnl.module))
(local core (autoload :nfnl.core))

(local {: augroup : autocmd : lnoremap} (require :config.utils))

[{1 :nvimdev/guard.nvim
  :dependencies [:nvimdev/guard-collection]
  :config (fn []
            (let [ft (require :guard.filetype)
                  guard (require :guard)]
              (-> (ft :python) (: :fmt :black))
              (-> (ft :fennel) (: :fmt :fnlfmt))
              (-> (ft "clojure,edn")
                  (: :fmt {:cmd :joker
                           :args [:--format "-"]
                           :stdin true
                           :ignore_error true}))
              (-> (ft "javascript,typescript,typescriptreact,css,scss,html,json,jsonc,yaml,markdown,graphql")
                  (: :fmt :prettier :lint :eslint))
              (-> (ft "scala,sbt")
                  (: :fmt {:cmd :scalafmt
                           :args [:--quiet :--stdin :--assume-filename]
                           :stdin true
                           :fname true}))
              (-> (ft "bash,sh,zsh") (: :fmt :shfmt))
              (guard.setup {:fmt_on_save true :lsp_as_default_formatter false})
              (lnoremap :n :F :<cmd>GuardFmt<cr> :Format)))}]
