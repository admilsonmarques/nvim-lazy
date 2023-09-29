(local cmp-src-menu-items
  {:copilot :copilot
   :conjure :conjure
   :nvim_lsp :lsp
   :luasnip :snippet
   :buffer :buffer
   :emoji :emoji
   :nerdfont :nerdfont})

(local cmp-srcs
  [{:name :copilot}
   {:name :nvim_lsp}
   {:name :luasnip}
   ;(:name :calc)
   {:name :conjure}
   {:name :buffer}
   {:name :emoji}
   {:name :nerdfont}])


;; Setup cmp with desired settings
(fn has-words-before []
  (let [(line col) (unpack (vim.api.nvim_win_get_cursor 0))]
    (and (not= col 0) (= (: (: (. (vim.api.nvim_buf_get_lines 0 (- line 1) line
                                                              true)
                                  1) :sub col
                               col) :match "%s") nil))))

(fn mapping [cmp luasnip]
  (cmp.mapping.preset.insert {:<C-k> (cmp.mapping.select_prev_item)
                              :<C-j> (cmp.mapping.select_next_item)
                              :<C-l> (cmp.mapping.complete)
                              :<ESC> (cmp.mapping.close)
                              :<TAB> (cmp.mapping.confirm {:behavior cmp.ConfirmBehavior.Insert
                                                          :select true})
                             ; :<Tab> (cmp.mapping (fn [fallback]
                              ;                       (if (cmp.visible)
                              ;                           (cmp.select_next_item)
                              ;                           (luasnip.expand_or_jumpable)
                              ;                           (luasnip.expand_or_jump)
                              ;                           (has-words-before)
                              ;                           (cmp.complete)
                              ;                           :else
                              ;                           (fallback)))
                              ;                     {1 :i 2 :s})
                              ; :<S-Tab> (cmp.mapping (fn [fallback]
                              ;                         (if (cmp.visible)
                              ;                             (cmp.select_prev_item)
                              ;                             (luasnip.jumpable -1)
                              ;                             (luasnip.jump -1)
                              ;                             :else
                              ;                             (fallback)))
                              ;                       {1 :i 2 :s})
                              }))

(fn opts [cmp luasnip]
  {:formatting {:format (fn [entry item]
                          (set item.menu
                               (or (. cmp-src-menu-items entry.source.name) ""))
                          item)}
   :mapping (mapping cmp)
   :snippet {:expand (fn [args]
                       (luasnip.lsp_expand args.body))}
   :window {:completion (cmp.config.window.bordered)
            :documentation (cmp.config.window.bordered)}
   :sources cmp-srcs})




[{1 :hrsh7th/nvim-cmp
  :version false
  :event :InsertEnter
  :dependencies [:hrsh7th/cmp-nvim-lsp
                 :hrsh7th/cmp-buffer
                 :hrsh7th/cmp-path
                 :saadparwaiz1/cmp_luasnip
                 :hrsh7th/cmp-copilot
                 :PaterJason/cmp-conjure
                 :hrsh7th/cmp-emoji
                 :saadparwaiz1/cmp_luasnip
                 :chrisgrieser/cmp-nerdfont
                 :L3MON4D3/LuaSnip
                 :github/copilot.vim]
 :config (fn []
           (let [cmp (require :cmp)
                 luasnip (require :luasnip)]
             (cmp.setup (opts cmp luasnip))))}]
