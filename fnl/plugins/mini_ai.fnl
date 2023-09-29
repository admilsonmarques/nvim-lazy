[{1 :echasnovski/mini.ai
  :dependencies [:nvim-treesitter-textobjects]
  :opts (fn []
          (let [ai (require :mini.ai)]
            {:n_lines 500
             :custom_textobjects {:o (ai.gen_spec.treesitter {:a ["@block.outer" "@conditional.outer" "@loop.outer"]
                                                   :i ["@block.inner" "@conditional.inner" "@loop.inner"] } {})
                                  :f (ai.gen_spec.treesitter {:a "@function.outer" :i "@function.inner"} {})
                                  :c (ai.gen_spec.treesitter {:a "@class.outer" :i "@class.inner"} {})
                               }}))}]
