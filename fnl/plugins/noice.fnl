(local {: autoload} (require :nfnl.module))
(local core (autoload :nfnl.core))


[{1 :folke/noice.nvim
  :event "VeryLazy"
  :dependencies [:MunifTanjim/nui.nvim :rcarriga/nvim-notify]
  :config (fn []
            (let [noice (require :noice)]
             (noice.setup {})))}]
