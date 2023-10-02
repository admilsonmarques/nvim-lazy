(local vim vim)
(local {: autoload} (require :nfnl.module))
(local fun (autoload :config.fun))
(local core (autoload :nfnl.core))
(local {: augroup : autocmd : noremap : llmap} (require :config.utils))

(fn lsp-binding []
  ;LSP
  (noremap :n :gd "<Cmd>lua vim.lsp.buf.definition()<CR>")
  (noremap :n :gD "<Cmd>lua vim.lsp.buf.declaration()<CR>")
  (noremap :n :gi "<Cmd>lua vim.lsp.buf.implementation()<CR>")
  (noremap :n :K "<Cmd>lua vim.lsp.buf.hover()<CR>")
  (llmap :n :d "<Cmd>lua vim.lsp.buf.definition()<CR>" :Definition)
  (llmap :n :D "<Cmd>lua vim.lsp.buf.declaration()<CR>" :Declaration)
  (llmap :n :K "<Cmd>lua vim.lsp.buf.hover()<CR>" :Hover)
  (llmap :n :t "<cmd>lua vim.lsp.buf.type_definition()<CR>" :TypeDefinition)
  (llmap :n :h "<cmd>lua vim.lsp.buf.signature_help()<CR>" "Signature Help")
  (llmap :n :n "<cmd>lua vim.lsp.buf.rename()<CR>" :Rename)
  (llmap :n :e "<cmd>lua vim.diagnostic.open_float()<CR>" "Float Diagnostics")
  (llmap :n :q "<cmd>lua vim.diagnostic.setloclist()<CR>")
  (llmap :n :f "<cmd>lua vim.lsp.buf.format()<CR>" :Format)
  (llmap :n :j "<cmd>lua vim.diagnostic.goto_next()<CR>" "Next Diag")
  (llmap :n :k "<cmd>lua vim.diagnostic.goto_prev()<CR>" "Prev Diag")
  (llmap :n :a "<cmd>lua vim.lsp.buf.code_action()<CR>" "Code Action")
  (llmap :v :a "<cmd>lua vim.lsp.buf.range_code_action()<CR> "
         "Range Code Action")
  ;telescope
  (llmap :n :w ":lua require('telescope.builtin').diagnostics()<cr>"
         "Telescope Diag")
  (llmap :n :r ":lua require('telescope.builtin').lsp_references()<cr>"
         "Telescope References")
  (llmap :n :i ":lua require('telescope.builtin').lsp_implementations()<cr>"
         "Telescope Implementations"))

(fn on-attach [client bufnr]
  (if (client.supports_method :textDocument/formatting)
      (do
        (vim.api.nvim_clear_autocmds {:group augroup :buffer bufnr})
        (vim.cmd "autocmd BufWritePre lua vim.lsp.buf.format()"))))

[{1 :neovim/nvim-lspconfig
  :opts {}
  :config (fn []
            (let [lspconfig (require :lspconfig)] ; (lsp-binding)
              (lsp-binding)
              (lspconfig.ansiblels.setup {})
              (lspconfig.clangd.setup {})
              (lspconfig.clojure_lsp.setup {})
              (lspconfig.cssls.setup {})
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
                                                                           :workspace {:library (vim.api.nvim_list_runtime_paths)}}}})
              (lspconfig.metals.setup {})
              (lspconfig.pyright.setup {})
              (lspconfig.tsserver.setup {:ft [:tsx :ts]
                                         :on_attach (fn [client bufnr]
                                                      (on-attach client bufnr))})
              (lspconfig.yamlls.setup {})))}]
