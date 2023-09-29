(local {: autoload} (require :nfnl.module))
(local core (autoload :nfnl.core))

(local float_opts
  {:border :curved
   :winblend 0
   })

(local execs
  {1 [nil :<M-1> "Horizontal Terminal" :horizontal 0.3]
   2 [nil :<M-2> "Vertical Terminal" :vertical 0.4]
   3 [nil :<M-3> "Float Terminal" :float nil]})

(local opts
  {:size 20
   :open_mapping "<C-\\>"
   :hide_numbers true
   :shade_filetypes {}
   :start_in_insert true
   :insert_mappings true
   :persist_size false
   :direction :float
   : float_opts
   : execs
   :shade_terminals false
   :shell vim.o.shell
   :close_on_exit true})

; Functions
(fn gen-term-app
  [cmd]
  (let [toggleterm (require :toggleterm)
        Terminal toggleterm.terminal.Terminal
        app (Terminal:new {: cmd
                           :hidden true
                           :hide_numbers true
                           :direction :float
                           : float_opts
                           :on_open (fn [_]
                                      (vim.cmd :startinsert!))
                           :on_close (fn [_])
                           :count 99
                           :close_on_exit true})]
    (app:toggle)))


(fn lazygit []
  (gen-term-app :lazygit))

(fn spt []
  (gen-term-app :spt ))


(local nkeys 
  [
   ; {1 :<leader>gg 2 (lazygit) :desc  :Lazygit}
    ; {1 :<leader>=  2 (spt) :desc :Spotify}
; {1 :<C-\\> 2 "<cmd>lua require('toggleterm').toggle()<CR>" :desc "Toggle Term" :mode :n}
   ]
  )

(local tkeys 
[
{1 :<C-h> 2 "<Cmd>wincmd h<CR>" :desc "Move to the left window"  :mode :t}
{1 :<C-j> 2 "<Cmd>wincmd j<CR>" :desc "Move to the below window" :mode :t}
{1 :<C-k> 2 "<Cmd>wincmd k<CR>" :desc "Move to the above window" :mode :t}
{1 :<C-l> 2 "<Cmd>wincmd l<CR>" :desc "Move to the right window" :mode :t}])


[{ 1 :akinsho/toggleterm.nvim
  :version "*"
  :lazy false
  :keys (core.merge nkeys tkeys)
  :opts opts
  ; :init {:spt (spt)}

  }]

