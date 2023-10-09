(local {: autoload} (require :nfnl.module))
(local core (autoload :nfnl.core))

(local icons (autoload :config.icons))
(local colors (autoload :config.colors))

(local disable [:neogitstatus
                :netrw
                :alpha
                :Outline
                :NeogitStatus
                :NeogitCommitMessage
                :NvimTree
                :packer
                :Trouble
                :Outline
                :spectre_panel
                :TelescopePrompt])

(local ignore [:help :packer :spectre_panel :TelescopePrompt])

(fn active-clients []
  (let [clients (vim.lsp.buf_get_clients)
        client_names []]
    (each [_ client (pairs clients)]
      (if (not= client.name :null-ls)
          (table.insert client_names client.name)))
    (if (> (length client_names) 0)
        (table.concat client_names ", ")
        "")))

(local diagnostics {1 :diagnostics
                    :sources [:nvim_diagnostic]
                    :sections [:error :warn]
                    :symbols {:error (core.get-in icons.all
                                                  [:diagnostics :BoldError])
                              :warn (core.get-in icons.all
                                                 [:diagnostics :BoldWarning])}
                    :colored true
                    :disabled_buftypes [:nvim-tree]
                    :padding 1
                    :update_in_insert false
                    :always_visible true})

(local left_separator (core.get icons.ui :CircleDividerLeft))

(local right_separator (core.get icons.ui :CircleDividerRight))

(local separators {:left left_separator :right right_separator})

(local mode {1 :mode :separator {:left left_separator} :right_padding 0})

(local diff {1 :diff
             :symbols {:added (core.get-in icons.all [:git :LineAdded])
                       :modified (core.get-in icons.all [:git :LineModified])
                       :removed (core.get-in icons.all [:git :LineRemoved])}
             :colored true
             :disabled_buftypes [:nvim-tree]
             :separator separators})

(local branch {1 "b:gitsigns_head"
               :icon (.. " " (core.get icons.git :Branch))
               :disabled_buftypes [:nvim-tree]
               :color {:gui :bold}
               :right_padding 1
               :separator separators})

(local filename {1 :filename
                 :icon_only true
                 :disabled_buftypes [:nvim-tree]
                 :colored true
                 :separator separators})

(local filetype {1 :filetype
                 :icon_only true
                 :disabled_buftypes [:nvim-tree]
                 :colored true
                 :separator separators})

(local language-server {1 (active-clients)
                        :disabled_buftypes [:nvim-tree]
                        :separator separators})

(local lsp-progress {1 :lsp_progress
                     :display_components [[:title :percentage :message]]
                     :timer {:progress_enddelay 500
                             :lsp_client_name_enddelay 500}
                     :separator separators})

(local sections {:lualine_a [mode]
                 :lualine_b [branch diff]
                 :lualine_c [diagnostics]
                 :lualine_x [filename]
                 :lualine_y [filetype lsp-progress language-server]
                 :lualine_z [:location
                             {1 :progress
                              :separator {:right (core.get icons.ui
                                                           :CircleDividerRight)}
                              :left_padding 1}]})

(local opts {:options {:icons_enabled true
                       :theme :auto
                       :component_separators "|"
                       :section_separators ""
                       :disabled_filetypes disable
                       :ignore_focus ignore
                       :always_divide_middle true
                       :globalstatus true}
             : sections
             :inactive_sections sections
             :extensions []})

[{1 :nvim-lualine/lualine.nvim
  :lazy false
  :dependencies [:lewis6991/gitsigns.nvim]
  :priority 1000
  :opts {}
  :config (fn []
            (let [lualine (require :lualine)]
              (lualine.setup opts)))}]
