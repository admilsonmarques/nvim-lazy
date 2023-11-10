(local {: autocmd : augroup} (require :config.utils))

(local brain "~/dev/ade/brain/")

(fn autoload-template [template group]
  (autocmd :BufNewFile {:pattern [(.. brain template :/*.norg)]
                        :command (.. "Neorg templates load " template)
                        : group}))

(local workspaces-configs {:workspaces {:notes (.. brain :notes)
                                        :daily (.. brain :daily)
                                        :weekly (.. brain :weekly)
                                        :work (.. brain :nubank)
                                        :rpg_fim_dos_tempos (.. brain
                                                                :rpg/fim-dos-tempos)
                                        :templates (.. brain :templates)}
                           :default_workspace :notes})

(local opts
       {:load {:core.defaults {}
               :core.concealer {:config {:icon_preset :basic}}
               :core.esupports.metagen {}
               :core.export {}
               :core.export.markdown {}
               :core.qol.toc {}
               :core.qol.todo_items {}
               :core.looking-glass {}
               :core.presenter {:config {:zen_mode :zen-mode}}
               :core.summary {}
               :core.ui.calendar {}
               :core.journal {:config {:strategy :nested :workspace :notes}}
               :core.integrations.telescope {}
               :external.templates {:config {:templates_dir (.. brain
                                                                :/templates)}}
               :core.dirman {:config workspaces-configs}
               :core.keybinds {:config {:default_keybinds true
                                        :neorg_leader :<leader><leader>}}}})

[{1 :folke/zen-mode.nvim}
 {1 :pysan3/neorg-templates :dependencies [:L3MON4D3/LuaSnip]}
 {1 :nvim-neorg/neorg
  :build ":Neorg sync-parsers"
  :cmd :Neorg
  :dependencies [:nvim-treesitter/nvim-treesitter
                 :nvim-lua/plenary.nvim
                 :nvim-neorg/neorg-telescope
                 :pysan3/neorg-templates]
  :config (fn []
            (let [neorg (require :neorg)
                  neorg-augroup (augroup :neorg-aucmd {:clear true})]
              ; (autoload-template :daily neorg-augroup)
              (neorg.setup opts)))}]
