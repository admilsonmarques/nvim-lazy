(local lspconfig (require :lspconfig))

; eslint-lsp eslint
;     ◍ typescript-language-server tsserver
;     ◍ fennel-language-server fennel_language_server
;     ◍ ansible-language-server ansiblels
;     ◍ bash-language-server bashls
;     ◍ clangd
;     ◍ clojure-lsp clojure_lsp
;     ◍ css-lsp cssls
;     ◍ dockerfile-language-server dockerls
;     ◍ html-lsp html
;     ◍ json-lsp jsonls
;     ◍ lua-language-server lua_ls
;     ◍ python-lsp-server pylsp
;     ◍ rust-analyzer rust_analyzer
;     ◍ sqlls

[{1 :williamboman/mason-lspconfig.nvim}
 {1 :williamboman/mason.nvim
  :dependencies [:neovim/nvim-lspconfig]
  :config (fn []
            (let [mason (require :mason)
                  mason-lspconfig (require :mason-lspconfig)]
              (mason.setup {})
              (mason-lspconfig.setup {})))}]
