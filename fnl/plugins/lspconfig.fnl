(local vim vim)
(local {: autoload} (require :nfnl.module))
(local fun (autoload :config.fun))
(local core (autoload :nfnl.core))
(local {: augroup : autocmd : buf_keymap : on-attach} (require :config.utils))

(fn fmt-autocmd [{: language : pattern : cmd}]
  (let [group (augroup (.. language :_formatter) {:clear true})]
    (autocmd :BufWritePre
             {: pattern
              : group
              :desc (.. "Auto-format " language " files before saving")
              :callback (vim.cmd (.. "!" cmd " " (vim.api.nvim_buf_get_name 0)))})))

(local set-keymaps (fn [client bufnr]
                     (do
                       (buf_keymap bufnr :n :<localleader>d
                                   "<Cmd>lua vim.lsp.buf.definition()<CR>")
                       (buf_keymap bufnr :n :K
                                   "<Cmd>lua vim.lsp.buf.hover()<CR>")
                       (buf_keymap bufnr :n :<localleader>D
                                   "<Cmd>lua vim.lsp.buf.declaration()<CR>")
                       (buf_keymap bufnr :n :<localleader>t
                                   "<cmd>lua vim.lsp.buf.type_definition()<CR>")
                       (buf_keymap bufnr :n :<localleader>h
                                   "<cmd>lua vim.lsp.buf.signature_help()<CR>")
                       (buf_keymap bufnr :n :<localleader>n
                                   "<cmd>lua vim.lsp.buf.rename()<CR>")
                       (buf_keymap bufnr :n :<localleader>e
                                   "<cmd>lua vim.diagnostic.open_float()<CR>")
                       (buf_keymap bufnr :n :<localleader>q
                                   "<cmd>lua vim.diagnostic.setloclist()<CR>")
                       (buf_keymap bufnr :n :<localleader>f
                                   "<cmd>lua vim.lsp.buf.format()<CR>")
                       (buf_keymap bufnr :n :<localleader>j
                                   "<cmd>lua vim.diagnostic.goto_next()<CR>")
                       (buf_keymap bufnr :n :<localleader>k
                                   "<cmd>lua vim.diagnostic.goto_prev()<CR>")
                       (buf_keymap bufnr :n :<localleader>a
                                   "<cmd>lua vim.lsp.buf.code_action()<CR>")
                       (buf_keymap bufnr :v :<localleader>a
                                   "<cmd>lua vim.lsp.buf.range_code_action()<CR> ")
                       ;telescope
                       (buf_keymap bufnr :n :<localleader>w
                                   ":lua require('telescope.builtin').diagnostics()<cr>")
                       (buf_keymap bufnr :n :<localleader>r
                                   ":lua require('telescope.builtin').lsp_references()<cr>")
                       (buf_keymap bufnr :n :<localleader>i
                                   ":lua require('telescope.builtin').lsp_implementations()<cr>")
                       (set client.server_capabilities.document_formatting
                            false)
                       (set client.server_capabilities.document_range_formatting
                            false))))

[{1 :neovim/nvim-lspconfig
  :opts {}
  :config (fn []
            (let [lspconfig (require :lspconfig)]
              (lspconfig.ansiblels.setup {})
              (lspconfig.clangd.setup {})
              (lspconfig.clojure_lsp.setup {})
              (lspconfig.cssls.setup {})
              (lspconfig.dockerls.setup {})
              (lspconfig.eslint.setup {:on_attach (fn [client bufnr]
                                                    (autocmd :BufWritePre
                                                             {:buffer bufnr
                                                              :command :EslintFixAll}))})
              (lspconfig.fennel_language_server.setup {:root_dir (lspconfig.util.root_pattern :fnl
                                                                                              :lua)
                                                       :settings {:fennel {:diagnostics {:globals [:vim
                                                                                                   :jit
                                                                                                   :comment]}
                                                                           :workspace {:library (vim.api.nvim_list_runtime_paths)}}}
                                                       :on_attach (fn []
                                                                    (fmt-autocmd {:language :Fennel
                                                                                  :pattern :*.fnl
                                                                                  :cmd "fnlfmt --fix"}))})
              (lspconfig.pyright.setup {})
              (lspconfig.tsserver.setup {})
              (lspconfig.yamlls.setup {})))}]
