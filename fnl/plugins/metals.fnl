(local {: g : autocmd : augroup : llmap} (require :config.utils))

(fn set-settings [metals-config]
  (let [opts {:superMethodLensesEnabled true
              :showImplicitArguments true
              :showImplicitConversionsAndClasses true
              :showInferredType true
              :showImplicitConversionsAndClasses true
              :serverVersion :latest.snapshot
              :serverProperties ["-XX:MaxRAMPercentage=80.0"
                                 :-Xss6M
                                 "-XX:-UseGCOverheadLimit"
                                 "-XX:+UseG1GC"]
              :enableSemanticHighlighting true
              :excludedPackages [:akka.actor.typed.javadsl
                                 :com.github.swagger.akka.javadsl]
              :javaHome "/usr/local/homebrew/Cellar/openjdk@8/1.8.0+352"}]
    (set metals-config.settings opts)))

(fn set-capabilities [metals-config]
  (let [cmp (require :cmo_nvim_lsp)]
    (set metals-config.capabilities (cmp.default_capabilities))))

(fn bindings []
  (llmap :n :m "<cmd>lua require('telescope').extensions.metals.commands()<cr>"
         "Telescope Metals"))

(fn metals-setup [metals metals-config]
  (let [cmp (require :cmo_nvim_lsp)]
    (set-settings metals-config)
    (set-capabilities metals-config) ; (set-autocmd)
    (set metals-config.init_options.statusBarProvider :on)
    (vim.cmd "
               hi! link LspCodeLens       CursorColumn
               hi! link LspReferenceText  CursorColumn
               hi! link LspReferenceRead  CursorColumn
               hi! link LspReferenceWrite CursorColumn
               ")
    metals-config))

[{1 :scalameta/nvim-metals
  :dependencies [:nvim-lua/plenary.nvim
                 :nvim-lua/popup.nvim
                 :hrsh7th/cmp-nvim-lsp]
  :config (fn []
            (let [metals (require :metals)
                  metals-config (metals.bare_config)
                  nvim_metals_group (augroup :nvim-metals {:clear true})]
              (bindings)
              (autocmd :FileType
                       {:desc "Initialize metals"
                        :pattern [:scala :sbt]
                        :callback (fn []
                                    (metals.initialize_or_attach (metals-setup metals
                                                                               metals-config)))
                        :group nvim_metals_group})))}]
