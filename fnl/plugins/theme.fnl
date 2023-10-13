(local styles {:comments {:italic true}
               :keywords {:italic true}
               :functions {:bold true}
               :variables {:italic false}
               :sidebars :transparent
               :floats :transparent})

(local tokyonight-config
       {:style :moon
        : styles
        :transparent true
        :transparent_background true
        :dim_inactive true
        :terminal_colors true
        :on_highlights (fn [hl c]
                         (set hl.CursorLineNr {:fg "#99a0c7"})
                         (set hl.LineNr {:fg "#586085"}))})

[{1 :rose-pine/neovim :lazy false :priority 1000}
 ; {1 :pineapplegiant/spaceduck
 ;  :lazy false
 ;  :priority 1000
 ;  :opts {}}
 {1 :catppuccin/nvim :lazy false :priority 1000}
 {1 :folke/tokyonight.nvim
  :lazy false
  :priority 1000
  :config (fn []
            (let [theme (require :tokyonight)]
              (theme.setup tokyonight-config)
              (vim.cmd "colorscheme tokyonight-moon")))}]
