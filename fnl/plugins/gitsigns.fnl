(local {: autoload} (require :nfnl.module))
(local core (autoload :nfnl.core))
(local icons (autoload :config.icons))

(local signs {:add {:hl :GitSignsAdd
                    :text (core.get icons.git :LineGeneral)
                    :numhl :GitSignsAddNr
                    :linehl :GitSignsAddLn}
              :change {:hl :GitSignsChange
                       :text (core.get icons.git :LineGeneral)
                       :numhl :GitSignsChangeNr
                       :linehl :GitSignsChangeLn}
              :delete {:hl :GitSignsDelete
                       :text (core.get icons.git :LineGeneral)
                       :numhl :GitSignsDeleteNr
                       :linehl :GitSignsDeleteLn}
              :topdelete {:hl :GitSignsDelete
                          :text (core.get icons.git :LineGeneral)
                          :numhl :GitSignsDeleteNr
                          :linehl :GitSignsDeleteLn}
              :changedelete {:hl :GitSignsChange
                             :text (core.get icons.git :LineGeneral)
                             :numhl :GitSignsChangeNr
                             :linehl :GitSignsChangeLn}})

(local opts {: signs
             :signcolumn true
             :numhl false
             :linehl false
             :word_diff false
             :watch_gitdir {:interval 100 :follow_files true}
             :attach_to_untracked true
             :current_line_blame true
             :current_line_blame_opts {:virt_text true
                                       :virt_text_pos :eol
                                       :delay 100
                                       :ignore_whitespace true}
             :current_line_blame_formatter_opts {:relative_time false}
             :sign_priority 6
             :update_debounce 100
             :status_formatter nil
             :max_file_length 40000
             :preview_config {:border :single
                              :style :minimal
                              :relative :cursor
                              :row 0
                              :col 1}
             :yadm {:enable false}})

(local nkeys
       [{1 :<leader>gj
         2 "<cmd>lua require 'gitsigns'.next_hunk()<cr>"
         :desc "Next Hunk"}
        {1 :<leader>gk
         2 "<cmd>lua require 'gitsigns'.prev_hunk()<cr>"
         :desc "Prev Hunk"}
        {1 :<leader>gl
         2 "<cmd>lua require 'gitsigns'.blame_line()<cr>"
         :desc :Blame}
        {1 :<leader>gp
         2 "<cmd>lua require 'gitsigns'.preview_hunk()<cr>"
         :desc "Preview Hunk"}
        {1 :<leader>gr
         2 "<cmd>lua require 'gitsigns'.reset_hunk()<cr>"
         :desc "Reset Hunk"}
        {1 :<leader>gR
         2 "<cmd>lua require 'gitsigns'.reset_buffer()<cr>"
         :desc "Reset Buffer"}
        {1 :<leader>gs
         2 "<cmd>lua require 'gitsigns'.stage_hunk()<cr>"
         :desc "Stage Hunk"}
        {1 :<leader>gu
         2 "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>"
         :desc "Undo Stage Hunk"}
        {1 :<leader>gd 2 "<cmd>Gitsigns diffthis HEAD<cr>" :desc :Diff}])

[{1 :lewis6991/gitsigns.nvim
  :event [:BufReadPost :BufNewFile]
  :keys nkeys
  :config (fn []
            (let [gitsigns (require :gitsigns)]
              (gitsigns.setup opts)))}]
