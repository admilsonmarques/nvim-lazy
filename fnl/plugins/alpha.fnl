(local {: autoload} (require :nfnl.module))
(local core (autoload :nfnl.core))

(local icons (autoload :config.icons))
; (local alpha (require :alpha))
; (local theme alpha.themes.theme)
; (local term alpha.term)
; (local fortune alpha.fortune)

(local max_width 55)
(local hl1 :String)
(local hl2 :Label)
(local hl3 :Statement)
(local hl4 :DevIconVim)

(local header {:type :group
               :val [; {:type :terminal
                     ; :command (core.str "  viu -t ~/downloads/doge.gif 2> /dev/null")
                     ; :width 20
                     ; :height 20
                     ; :opts {:position :center :redraw true :hl hl1}}
                     {:type :text
                      :val ["                                     "
                            "      __                _            "
                            "   /\\ \\ \\___  ___/\\   /(_)_ __ ___   "
                            "  /  \\/ / _ \\/ _ \\ \\ / | | '_ ` _ \\  "
                            " / /\\  |  __| (_) \\ v /| | | | | | | "
                            " \\_\\ \\/ \\___|\\___/ \\_/ |_|_| |_| |_| "
                            "                                     "]
                      :opts {:position :center :hl hl4}}
                     {:type :text
                      :val (core.str (os.date))
                      :opts {:position :center :hl hl3}}]
               :opts {:hl hl2 :position :center}})

(fn quick_btn [theme]
  {:type :group
   :val [{:type :text :val "quick links" :opts {:hl hl1 :position :center}}
         {:type :padding :val 0}
         (theme.button :e (.. (core.get icons.ui :NewFile) "  new file")
                       :<cmd>ene!<cr>)
         (theme.button :f (.. (core.get icons.ui :FindFile) "  find file")
                       "<cmd>Telescope find_files<cr>")
         (theme.button :p (.. (core.get icons.ui :Project) "  projects")
                       "<cmd>Telescope projects<cr>")
         (theme.button :r (.. (core.get icons.ui :History) "  recent files")
                       "<cmd>Telescope oldfiles<cr>")
         (theme.button :t (.. (core.get icons.ui :FindText) "  find text")
                       "<cmd>Telescope live_grep<cr>")
         (theme.button :c (.. (core.get icons.ui :Gear) "  configuration")
                       "<cmd>edit ~/.config/nvim/fnl/plugins/general.fnl<cr>")]
   :opts {:hl hl2 :position :center}})

(fn note_btn [theme]
  {:type :group
   :val [{:type :text :val "Note Taking" :opts {:hl hl1 :position :center}}
         {:type :padding :val 0}
         (theme.button :n (.. (core.get icons.ui :TNote) "  New note")
                       "<CMD>Telekasten new_templated_note<CR>")
         (theme.button :d (.. (core.get icons.ui :TDaily) "  Daily note")
                       "<CMD>Telekasten goto_today<CR>")
         (theme.button :w (.. (core.get icons.ui :TWeekly) "  Weekly note")
                       "<CMD>Telekasten goto_thisweek<CR>")
         (theme.button :s (.. (core.get icons.ui :Search) "  Search notes")
                       "<CMD>Telekasten find_notes<CR>")]
   :opts {:hl hl2 :position :center}})

(fn fortune_footer [fortune]
  {:type :text :val fortune :opts {:hl :Statement :position :center}})

(fn definitions [theme fortune]
  {:layout [{:type :padding :val 3}
            header
            {:type :padding :val 1}
            (quick_btn theme)
            {:type :padding :val 2}
            (note_btn theme)
            {:type :padding :val 2}
            (fortune_footer fortune)
            {:type :padding :val 1}
            ;             ;; 10 date
            ;             ;; 11 {:type "padding" :val 1}
            ]
   :opts {:noautocmd false :redraw_on_resize true}})

; (fn setup []
;   (alpha.setup config))

; (let [alpha (require :alpha)
;                   theme (require :alpha.themes.dashboard)
;                   fortune (require :alpha.fortune) ]
;             ( definitions theme fortune))

[{1 :goolord/alpha-nvim
  :dependencies [:nvim-tree/nvim-web-devicons]
  :config (fn []
            (let [alpha (require :alpha)
                  theme (require :alpha.themes.dashboard)
                  fortune (require :alpha.fortune)]
              (alpha.setup (definitions theme fortune))))}]
