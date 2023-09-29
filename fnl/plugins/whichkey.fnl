(local {: opt} (require :config.utils))
(local {: autoload} (require :nfnl.module))
(local core (autoload :nfnl.core))

(local plugins {:marks true
                :registers true
                :spelling {:enabled true :suggestions 20}
                :presets {:operators false
                          :motions false
                          :text_objects false
                          :windows false
                          :nav false
                          :z true
                          :g true}})

(local icons {:breadcrumb_separator "➜"
              :group_separator "➜"
              :separator "➜"
              :prompt "➜"})

(local popup_mappings {:scroll_down :<c-j> :scroll_up :<c-k>})

(local window {:border :single
               :position :bottom
               :margin [1 0 1 0]
               :padding [2 2 2 2]
               :winblend 0})

(local layout {:height {:min 4 :max 25}
               :width {:min 20 :max 50}
               :spacing 3
               :align :left})

(local hidden [:<silent> :<cmd> :<Cmd> :<CR> :call :lua "^:" "^ "])

(local opts {: plugins
             : icons
             : popup_mappings
             : window
             : layout
             : hidden
             :ignore_missing false
             :show_help true
             :trigger :auto
             :disable {:filetypes [:netrw]}
             :triggers_blacklist {:i [:j :k] :v [:j :k]}})

(local nopts {:mode :n
              :prefix :<leader>
              :buffer nil
              :silent true
              :noremap true
              :nowait true})

(local lsp {:name :LSP
            :a ["<cmd>lua vim.lsp.buf.code_action()<cr>" "Code Action"]
            :f ["<cmd>lua vim.lsp.buf.format { async = true }<cr>" :Format]
            :i ["<cmd>lua require('telescope.builtin').lsp_implementations()<cr>"
                "telescope implementations"]
            :l ["<cmd>lua vim.lsp.codelens.run()<cr>" "CodeLens Action"]
            :m ["<cmd>lua require('telescope').extensions.metals.commands()<CR>"
                :Metals]
            :n ["<cmd>lua vim.lsp.buf.rename()<cr>" :Rename]
            :s ["<cmd>Telescope lsp_document_symbols<cr>" "Document Symbols"]
            :S ["<cmd>Telescope lsp_dynamic_workspace_symbols<cr>"
                "Workspace Symbols"]
            :d ["<Cmd>lua vim.lsp.buf.declaration()<CR>" :declaration]
            :t ["<cmd>lua vim.lsp.buf.type_localinition()<CR>"
                :type_definition]
            :h ["<cmd>lua vim.lsp.buf.signature_help()<CR>" :signature_help]
            :e ["<cmd>lua vim.diagnostic.open_float()<CR>" "diag open_float"]
            :q ["<cmd>lua vim.diagnostic.setloclist()<CR>" "diag setloclist"]
            :k ["<cmd>lua vim.diagnostic.goto_next()<CR>" "diag goto_next"]
            :j ["<cmd>lua vim.diagnostic.goto_prev()<CR>" "diag goto_prev"]
            :w ["<cmd>lua require('telescope.builtin').diagnostics()<cr>"
                "telescope diagnostics"]
            :r ["<cmd>lua require('telescope.builtin').lsp_references()<cr>"
                "telescope references"]
            :i ["<cmd>lua require('telescope.builtin').lsp_implementations()<cr>"
                "telescope implementations"]})

(local nmappings (core.merge {; :a ["<cmd>Telescope lsp_document_symbols theme=dropdown<cr>"
                              ;     "Document Symbols"]
                              :d {:name :diag}
                              :q [:<cmd>bdelete!<CR> "Close Buffer"]
                              :f {:name :find}
                              :g {:name :git}
                              ;    :l lsp
                              :E ["<cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>"
                                  "File Browser"]
                              :r {:name :replace}
                              :t {:name :notes}
                              ; ;   :T treesiter.bindings
                              ";" [:<cmd>Alpha<cr> :Dashboard]
                              :P ["<CMD>Telescope projects<CR>" :Projects]
                              :z {:name :folds}}))

[{1 :folke/which-key.nvim
  :event :VeryLazy
  :init (fn []
          (opt :timeout true)
          (opt :timeoutlen 300)
          (let [wk (require :which-key)]
            (wk.setup opts)
            (wk.register nmappings nopts)))}]
