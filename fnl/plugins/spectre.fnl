[{1 :nvim-pack/nvim-spectre
  :cmd :Spectre
  :keys [{1 :<Leader>rs
          2 "<cmd>lua require('spectre').toggle()<cr>"
          :desc "Spectre Toggle"}
         {1 :<Leader>rf
          2 "<cmd>lua require('spectre').open_file_search()<cr>"
          :desc "Spectre File"}
         {1 :<Leader>rw
          2 "<cmd>lua require('spectre').open_visual({select_word=true})<cr>"
          :desc "Spectre Word"}]
  :opts {:open_cmd "noswapfile vnew"}}]
