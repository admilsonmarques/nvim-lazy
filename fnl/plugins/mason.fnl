(local opts {:ui {:border :rounded
                  :icons {:package_installed "✓"
                          :package_pending "➜"
                          :package_uninstalled "✗"}}
             :max_concurrent_installers 10})

[{1 :williamboman/mason-lspconfig.nvim}
 {1 :williamboman/mason.nvim
  :dependencies [:neovim/nvim-lspconfig]
  :config (fn []
            (let [mason (require :mason)
                  mason-lspconfig (require :mason-lspconfig)]
              (mason.setup opts)
              (mason-lspconfig.setup {})))}]
