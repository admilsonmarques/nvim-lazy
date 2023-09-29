[{1 :rafamadriz/friendly-snippets}
 {1 :L3MON4D3/LuaSnip
  :dependencies [:rafamadriz/friendly-snippets]
  :build "make install_jsregexp"
  :opts {:history true
         :delete_check_events :TextChanged}
  :config (fn []
            (let [luasnip (require :luasnip)
                  from_vscode (require :luasnip.loaders.from_vscode)]
              (from_vscode.lazy_load)))}]
