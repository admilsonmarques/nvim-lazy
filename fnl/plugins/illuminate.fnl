[{1 :RRethy/vim-illuminate
  :event [:BufReadPost :BufNewFile]
  :opts {:delay 200
         :large_file_cutoff 2000
         :large_files_override {:providers [:lsp]}}
  :config (fn [_ opts]
            (let [illuminate (require :illuminate)]
              (illuminate.configure opts)))}]
