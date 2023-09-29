(local {: g
        : opt
        : autocmd} (require :config.utils))

(local opts {:line_starts_at 3})

[{1 :m00qek/baleia.nvim
  :config (fn []
            (let [baleia (require :baleia)]
              (g :baleia (baleia.setup opts))
              (autocmd
                "BufWinEnter"
                {:desc "ANSI colorize repl"
                 :pattern [:conjure-log-*]
                 :command "call g:baleia.automatically(bufnr('%'))"})
              ))}]
