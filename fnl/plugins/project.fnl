(local opts {:manual_mode false
             :detection_methods [:pattern]
             :patterns [:.git :.nfnl.fnl :src]
             :ignore_lsp {}
             :exclude_dirs {}
             :show_hidden true
             :silent_chdir true
             :scope_chdir :tab
             :update_focused_file {:enabled true :update_cwd true}
             ;:datapath (nvim.fn.stdpath :data)
             })

[{1 :ahmedkhalf/project.nvim
  :lazy true
  :config (fn []
            (let [project (require :project_nvim)]
              (project.setup opts)))}]
