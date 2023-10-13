;https://github.com/kevinhwang91/nvim-ufo#minimal-configuration
(local {: lnoremap} (require :config.utils))

(fn bindings []
  (lnoremap :n :zR "<cmd>lua require 'config.plugin.ufo'.openAllFolds()<cr>"
            "Open all folds")
  (lnoremap :n :zM "<cmd>lua require 'config.plugin.ufo'.closeAllFolds()<cr>"
            "Close all Folds"))

(local opts {:provider_selector (fn [_ _ _]
                                  [:treesitter :indent])
             :close_fold_kinds [:import :comments]
             :preview {:win_config {:border ["" "-" "" "" "" "-" "" ""]
                                    :winhighlight "Normal:Folded"
                                    :winblend 0}}
             ; :fold_virt_text_handler ""
             :enable_get_fold_virt_text true})

[{1 :kevinhwang91/nvim-ufo
  :dependencies [:kevinhwang91/promise-async]
  :config (fn []
            (let [ufo (require :ufo)]
              (bindings)
              (ufo.setup opts)))}]
