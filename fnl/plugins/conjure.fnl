(local {: g : opt : autocmd} (require :config.utils))

[{1 :Olical/conjure
  :ft [:clojure :fennel :clj]
  :init (fn []
          (g "conjure#eval#result_register" "*")
          (g "conjure#log#botright" true)
          (g "conjure#mapping#doc_word" :K)
          (g "conjure#log#strip_ansi_escape_sequences_line_limit" 0)
          (g "conjure#extract#tree_sitter#enabled" true)
          (g "conjure#client#clojure#nrepl#connection#auto_repl#enabled" true)
          (g "conjure#client#clojure#nrepl#connection#auto_repl#hidden" false)
          (g "conjure#client#clojure#nrepl#connection#auto_repl#cmd" :Lein!)
          (g "conjure#client#clojure#nrepl#eval#auto_require" true)
          (g "conjure#client#clojure#nrepl#test#current_form_names"
             [:deftest :defflow])
          (g "conjure#extract#tree_sitter#enabled" true)
          ;; Set e register for evaluation result
          (g "conjure#eval#result_register" :e)
          ;; Evaluate root form (top level form) under the cursor
          ;; Default: `"er"`
          (g "conjure#mapping#eval_root_form" :ef)
          ;; Evaluate root form under the cursor & insert result as comment
          ;; Default: `"ecr"`
          (g "conjure#mapping#eval_comment_root_form" "e;")
          ;; Evaluate file loaded from disk
          ;; Default: `"ef"`
          (g "conjure#mapping#eval_file" :el)
          ;; Width of HUD as percentage of the editor width
          ;; A float between 0.0 and 1.0.
          ;; Default: `0.42`
          (g "conjure#log#hud#width" 1)
          ;; Display HUD
          ;; Default: `true`
          (g "conjure#log#hud#enabled" false)
          (g "conjure#log#hud#height" 0.2)
          ;; Preferred corner position for the HUD, over-ridden by HUD cursor detection
          ;; Example: Set to `"SE"` and HUD width to `1.0` for full width HUD at bottom of screen
          ;; Default: `"NE"`
          (g "conjure#log#hud#anchor" :SE)
          ;; Open log at bottom or far right of editor, using full width or height
          ;; Default: `false`
          (g "conjure#log#botright" true)
          (g "conjure#log#wrap" true)
          (g "conjure#log#fold#enabled" false)
          ;; Number of lines to check for `ns` form, used for setting evaluation context
          ;; `b:conjure#context` to override a specific buffer that isn't finding the context
          ;; Default: `24`
          (g "conjure#extract#context_header_lines" 100)
          ;; Highlight
          (g "conjure#highlight#enabled" true)
          (g "conjure#client#fennel#aniseed#aniseed_module_prefix" :aniseed.)
          (autocmd :BufNewFile
                   {:desc "Conjure Log disable LSP diagnostics"
                    :callback (fn []
                                (vim.diagnostic.disable 0))
                    :group (vim.api.nvim_create_augroup :conjure_log_disable_lsp
                                                        {:clear true})
                    :pattern [:conjure-log-*]})
          (autocmd :FileType {:desc "Lisp style line comment"
                              :callback (fn []
                                          (set vim.bo.commentstring ";; %s"))
                              :group (vim.api.nvim_create_augroup :comment_config
                                                                  {:clear true})
                              :pattern [:clojure]})
          (autocmd :FileType
                   {:desc "Jack-in Lein and Conjure"
                    :pattern [:clojure]
                    :command "nnoremap <silent> <localleader>cc <cmd>Lein!<cr><bar><cmd>ConjureLogVSplit<cr><bar><cmd>ConjureConnect<cr>"})
          (autocmd :FileType
                   {:pattern [:clojure :fennel :scheme]
                    :command "nnoremap <silent> gd <cmd>ConjureDefWord<CR>"})
          (autocmd :FileType
                   {:pattern [:clojure :fennel :scheme]
                    :command "nnoremap <silent> <c-]> <cmd>ConjureDefWord<CR>"})
          (autocmd :FileType
                   {:pattern [:clojure :fennel :scheme]
                    :command "nnoremap <silent> K <cmd>ConjureDocWord<CR>"})
          (autocmd :FileType
                   {:pattern [:clojure :fennel :scheme]
                    :command "nnoremap <silent> gD <cmd>ConjureCljViewSource<CR>"}))}]
