(local {: autoload} (require :nfnl.module))

(local core (autoload :nfnl.core))

[{1 :echasnovski/mini.indentscope
  :version false
  :event [:BufReadPost :BufNewFile]
  :opts {:symbol "│"
         :options {:try_as_border true}}
  ; :init (fn []
  ;         (vim.api.nvim_create_autocmd "FileType" {:pattern ["help"
  ;                                                            "alpha"
  ;                                                            "dashboard"
  ;                                                            "nvim-tree"
  ;                                                            "Trouble"
  ;                                                            "lazy"
  ;                                                            "mason"
  ;                                                            "notify"
  ;                                                            "toggleterm"
  ;                                                            "lazyterm"]
  ;                                                  :callback (fn [] (vim.b.miniindentscope_disable true))}))
  }]
