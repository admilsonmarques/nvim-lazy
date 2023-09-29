(local nkeys 
  [{1 :<leader>dd 2 "<cmd>TroubleToggle<cr>" :desc "Trouble Toggle"}])

[{1 :folke/trouble.nvim
  :dependencies [:nvim-tree/nvim-web-devicons]
  :cmd [:TroubleToggle :Trouble]
  :keys nkeys
  :opts {:use_diagnostic_signs true}}]
