;https://github.com/kevinhwang91/nvim-ufo#minimal-configuration
(local nkeys 
  [{1 :<leader>zR 2 "<cmd>lua require 'config.plugin.ufo'.openAllFolds()<cr>" :desc "Open all Folds"}
   {1 :<leader>zM 2 "<cmd>lua require 'config.plugin.ufo'.closeAllFolds()<cr>" :desc   "Close all Folds"}])

; (utils.setup :ufo {:provider_selector (fn [bufnr filetype buftype]
;                                         [:treesitter :indent])
;                    :close_fold_kinds [:import :comments]
;                    :preview {:win_config {:border ["" "-" "" "" "" "-" "" ""]
;                                           :winhighlight "Normal:Folded"
;                                           :winblend 0}}
;                    ; :fold_virt_text_handler ""
;                    :enable_get_fold_virt_text true})

[{1 :kevinhwang91/nvim-ufo
  :keys nkeys
  :dependencies [:kevinhwang91/promise-async]}]
