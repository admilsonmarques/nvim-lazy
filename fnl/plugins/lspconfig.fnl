(local vim vim)
(local {: autoload} (require :nfnl.module))
(local fun (autoload :config.fun))
(local core (autoload :nfnl.core))
(local {: augroup : autocmd : fmt-autocmd : buf_keymap : on-attach}
       (require :config.utils))

(local fmt-group (augroup :lsp-formatters {:clear true}))
; (local general-capabilities
;   (let [capabilities (vim.lsp.protocol.make_client_capabilities)]
;     (core.assoc capabilities :textDocument :hover :dynamicRegistration true)
;     (core.assoc capabilities :textDocument :completion :completionItem :snippetSupport true)
;     (core.assoc capabilities :textDocument :completion :completionItem :resolveSupport
;            {:properties [:documentation :detail :additionalTextEdits]})))

; ;server features
; (def handlers
;   {:textDocument/publishDiagnostics (vim.lsp.with vim.lsp.diagnostic.on_publish_diagnostics
;                                       {:virtual_text false
;                                        :signs true
;                                        :underline true
;                                        :update_in_insert false
;                                        :severity_sort false})
;    :textDocument/hover (vim.lsp.with vim.lsp.handlers.hover
;                          {:border :single})
;    :textDocument/signatureHelp (vim.lsp.with vim.lsp.handlers.signature_help
;                                  {:border :single})})

; (defn navic_on_attach
;   [client bufnr]
;   (let [navic (utils.prequire :nvim-navic)]
;     (navic.attach (client bufnr))))

; ; (def- capabilities (cmplsp.default_capabilities))

(local teste "abc")
(local on_attach (fn [client bufnr]
                   (do
                     (buf_keymap bufnr :n :gd
                                 "<Cmd>lua vim.lsp.buf.definition()<CR>")
                     (buf_keymap bufnr :n :K "<Cmd>lua vim.lsp.buf.hover()<CR>")
                     (buf_keymap bufnr :n :<leader>ld
                                 "<Cmd>lua vim.lsp.buf.declaration()<CR>")
                     (buf_keymap bufnr :n :<leader>lt
                                 "<cmd>lua vim.lsp.buf.type_definition()<CR>")
                     (buf_keymap bufnr :n :<leader>lh
                                 "<cmd>lua vim.lsp.buf.signature_help()<CR>")
                     (buf_keymap bufnr :n :<leader>ln
                                 "<cmd>lua vim.lsp.buf.rename()<CR>")
                     (buf_keymap bufnr :n :<leader>le
                                 "<cmd>lua vim.diagnostic.open_float()<CR>")
                     (buf_keymap bufnr :n :<leader>lq
                                 "<cmd>lua vim.diagnostic.setloclist()<CR>")
                     (buf_keymap bufnr :n :<leader>lf
                                 "<cmd>lua vim.lsp.buf.format()<CR>")
                     (buf_keymap bufnr :n :<leader>lj
                                 "<cmd>lua vim.diagnostic.goto_next()<CR>")
                     (buf_keymap bufnr :n :<leader>lk
                                 "<cmd>lua vim.diagnostic.goto_prev()<CR>")
                     (buf_keymap bufnr :n :<leader>la
                                 "<cmd>lua vim.lsp.buf.code_action()<CR>")
                     (buf_keymap bufnr :v :<leader>la
                                 "<cmd>lua vim.lsp.buf.range_code_action()<CR> ")
                     ;telescope
                     (buf_keymap bufnr :n :<leader>lw
                                 ":lua require('telescope.builtin').diagnostics()<cr>")
                     (buf_keymap bufnr :n :<leader>lr
                                 ":lua require('telescope.builtin').lsp_references()<cr>")
                     (buf_keymap bufnr :n :<leader>li
                                 ":lua require('telescope.builtin').lsp_implementations()<cr>")
                     (set client.server_capabilities.document_formatting false)
                     (set client.server_capabilities.document_range_formatting
                          false))))

; :opts (fn [_ opts]
;           ; (set opts.ensure_installed (utils.list_insert_unique opts.ensure_installed [:fennel_language_server]))

;           (set opts.handlers.lua_ls
;                (fn []
;                  (lspconfig.lua_ls.setup
;                    {:settings {:Lua {:diagnostics {:globals [:vim :jit]}}}})))

;           (set opts.handlers.fennel_language_server
;                (fn []
;                  (lspconfig.fennel_language_server.setup
;                    {:filetypes [:fennel]
;                     :root_dir (lspconfig.util.root_pattern :fnl :lua)
;                     :single_file_support true
;                     :settings {:fennel {:diagnostics {:globals [:vim :jit :comment]}
;                                         :workspace {:library (vim.api.nvim_list_runtime_paths)}}}})))

[{1 :neovim/nvim-lspconfig
  :opts {}
  :config (fn []
            (let [lspconfig (require :lspconfig)]
              (lspconfig.ansiblels.setup {})
              (lspconfig.clangd.setup {})
              (lspconfig.clojure_lsp.setup {}) ; (lspconfig.cssls.setup {:capabilities general-capabilities})
              (lspconfig.dockerls.setup {})
              (lspconfig.eslint.setup {:on_attach (fn [_ bufnr]
                                                    (autocmd :BufWritePre
                                                             {:buffer bufnr
                                                              :command :EslintFixAll}))})
              (lspconfig.fennel_language_server.setup {:root_dir (lspconfig.util.root_pattern :fnl
                                                                                              :lua)
                                                       :settings {:fennel {:diagnostics {:globals [:vim
                                                                                                   :jit
                                                                                                   :comment]}
                                                                           :workspace {:library (vim.api.nvim_list_runtime_paths)}}}
                                                       ; :on_attach (on-attach (fn []
              ;                                          ;                         (autocmd :BufWritePre
              ;                                          ;                                  {:pattern :*.fnl
              ;                                          ;                                   :desc "Auto-format Fennel files before saving"
              ;                                          ;                                   :callback (vim.cmd (.. "!"
              ;                                          ;                                                          "fnlfmt --fix"
              ;                                          ;                                                          " "
              ;                                          ;                                                          (vim.api.nvim_buf_get_name 0)))
              ;                                          ;                                   :group fmt-group})
              ;                                          ;                         (autocmd :BufWritePost
              ;                                          ;                                  {:pattern :*.fnl
              ;                                          ;                                   :command :e
              ;                                          ;                                   :group fmt-group})))
                                                       })
              (lspconfig.pyright.setup {})
              (lspconfig.tsserver.setup {})
              (lspconfig.yamlls.setup {})))}]
