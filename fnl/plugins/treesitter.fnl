(local {: autoload} (require :nfnl.module))
(local core (autoload :nfnl.core))

(local ensure_installed [:bash
                         :c
                         :clojure
                         :css
                         :dockerfile
                         :fennel
                         :go
                         :http
                         :html
                         :java
                         :javascript
                         :json
                         :lua
                         :markdown
                         :norg
                         :norg_meta
                         :python
                         :rust
                         :scala
                         :typescript
                         :vim
                         :yaml])

(local context_commentstring {:enable true
                              :enable_autocmd false
                              :config {:typescript "// %s"
                                       :css "/* %s */"
                                       :scss "/* %s */"
                                       :html "<!-- %s -->"
                                       :svelte "<!-- %s -->"
                                       :vue "<!-- %s -->"
                                       :json ""}})

(local ignore_install {:haskell :jsonc})

(local opts
       {: ensure_installed
        : context_commentstring
        :highlight {:enable true :additional_vim_regex_highlighting false}
        :indent {:enable true :disable [:yaml :python]}
        : ignore_install
        :auto_install true
        :incremental_selection {:enable true}
        :rainbow {:enable true :extended_mode true :max_file_lines 1000}})

(fn commentstring_opts [commentstring]
  {:active true
   :padding true
   :sticky true
   :ignore "^$"
   :mappings {:basic true :extra true}
   :toggler {:line :gcc :block :gbc}
   :opleader {:line :gc :block :gb}
   :extra {:above :gcO :below :gco :eol :gcA}
   :pre_hook (commentstring.create_pre_hook)
   :post_hoot nil})

; (local nkeys
;   [{1 :<leader>Tp 2 :<cmd>TSPlaygroundToggle<cr> :desc :Playground}
;    {1 :<leader>Ti 2 :<cmd>TSInstall<cr> :desc :Install}
;    {1 :<leader>Tu 2:<cmd>TSUpdate<cr> :desc :Update}
;    {1 :<leader>Tb 2:<cmd>TSBufToggle<cr> :desc "Buffer Toggle"}
;    {1 :<leader>TI 2 "" :desc :Info}
;    {1 :<leader>TIm 2 :<cmd>TSModuleInfo<cr> :desc :Modules]
;    {1 :<leader>TIi 2 :<cmd>TSInstallInfo<cr> :desc :Install]}])

[{1 :JoosepAlviste/nvim-ts-context-commentstring :lazy false}
 {1 :nvim-treesitter/nvim-treesitter
  :lazy false
  :build ":TSUpdate"
  :dependencies [:nvim-treesitter/nvim-treesitter-textobjects
                 :JoosepAlviste/nvim-ts-context-commentstring
                 :p00f/nvim-ts-rainbow]
  :config (fn []
            (let [treesitter (require :nvim-treesitter.configs)]
              (treesitter.setup opts)))}
 {1 :numToStr/Comment.nvim
  :lazy false
  :opts (fn []
          (let [commentstring (require :ts_context_commentstring.integrations.comment_nvim)]
            (commentstring_opts commentstring)))}]
