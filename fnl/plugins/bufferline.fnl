(local {: noremap} (require :config.utils))

(local offset {1 {:filetype :undotree
                 :text :Undotree
                 :highlight :PanelHeading
                 :padding 1}
              2 {:filetype :NvimTree
                 :text :Explorer
                 :highlight :PanelHeading
                 :padding 1}
              3 {:filetype :DiffviewFiles
                 :text "Diff View"
                 :highlight :PanelHeading
                 :padding 1}
              4 {:filetype :flutterToolsOutline
                 :text "Flutter Outline"
                 :highlight :PanelHeading
                 :padding 1}
              5 {:filetype :packer
                 :text :Packer
                 :highlight :PanelHeading
                 :padding 1}})

(local opts {:options {:mode :buffers
                      :numbers :none
                      :close_command ""
                      :right_mouse_command "vert sbuffer %d"
                      :left_mouse_command "buffer %d"
                      :middle_mouse_command nil
                      :indicator {:icon "▎" :style :icon}
                      :close_icon ""
                      :buffer_close_icon ""
                      :modified_icon "●"
                      :close_icon ""
                      :left_trunc_marker ""
                      :right_trunc_marker ""
                      ; :left_trunc_marker :l
                      ; :right_trunc_market :r
                      ; :name_formatter ""
                      ; :max_name_length 18
                      ; :max_prefix_length 15
                      ; :truncate_names true
                      ; :tab_size 18
                      :diagnostics :nvim_lsp
                      ; :diagnostics_update_in_insert true
                      ; : offset
                      ; :color_icons true
                      ; :show_buffer_icons true
                      ; :show_buffer_close_icons true
                      ; :persist_buffer_sort true
                      :separator_style :thin
                      ; :enforce_regular_tabs false
                      ; :always_show_bufferline false
                      :hover {:enable true :delay 100 :reveal [:close]}
                      :sort_by :directory}})


[{1 :akinsho/bufferline.nvim
  :version "*"
  :dependencies [:nvim-tree/nvim-web-devicons]
  :config (fn []
            (let [bufferline (require :bufferline)]
              (bufferline.setup opts)
              (noremap :n :<S-l> ":BufferLineCycleNext<CR>")
              (noremap :n :<S-h> ":BufferLineCyclePrev<CR>")))}]
