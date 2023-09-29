(local brain "~/dev/ade/brain/")
(local workspaces-configs
  {:workspaces {
                :notes (.. brain "notes")
                :work (.. brain "nubank")
                :rpg_fim_dos_tempos (.. brain "rpg/fim-dos-tempos")
                :templates (.. brain "templates")}
   :default_workspace :notes})


(local opts
  {:load {
          :core.defaults {}
          :core.concealer {}
          :core.export {}
          :core.export.markdown {}
          :core.presenter {:config {:zen_mode :zen-mode}}
          :core.summary {}
          :core.ui.calendar {}
          :core.integrations.telescope {}
          :external.templates {:config {:templates_dir (.. brain "/templates")}}
          :core.dirman {:config workspaces-configs}}})

[{1 :folke/zen-mode.nvim}
 {1 :pysan3/neorg-templates
  :dependencies [:L3MON4D3/LuaSnip]}
 {1 :nvim-neorg/neorg
  :build ":Neorg sync-parsers"
  :dependencies [:nvim-lua/plenary.nvim
                 :nvim-neorg/neorg-telescope
                 :pysan3/neorg-templates]
  :config (fn []
            (let [neorg (require :neorg)]
              (neorg.setup opts)))}]
