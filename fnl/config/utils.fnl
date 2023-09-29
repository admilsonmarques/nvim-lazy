(local {: autoload} (require :nfnl.module))
(local fun (autoload :config.fun))
(local core (autoload :nfnl.core))
(local vim vim)
(fn +docs [opts to]
  (core.update opts :desc (fn [desc] (or desc to))))

(fn vis-op+ [op args]
  #(op [(vim.api.nvim_buf_get_mark 0 "<") (vim.api.nvim_buf_get_mark 0 ">")]
       args))

(fn +buffer [opts buffer]
  (core.update opts :buffer (fn [b] (or b buffer))))

(fn bkset [modes from to opts]
  (let [opts (if (= (type opts) :table) (+buffer opts 0)
                 (= (type opts) :number) {:buffer opts}
                 (= (type opts) :string) {:desc opts}
                 {:buffer 0})]
    (vim.keymap.set modes from to (+docs opts to))))

(fn opt [key value]
  "Set a vim option"
  (tset vim.opt key value))

(fn g [key value]
  "Set a vim option"
  (tset vim.g key value))

(fn last [xs]
  (fun.nth (fun.length xs) xs))

(fn colorscheme [name]
  "Set the current colorscheme"
  (vim.cmd (.. "colorscheme " name)))

(fn tx [...]
  (let [args [...]
        len (fun.length args)]
    (if (= :table (type (last args)))
        (fun.reduce (fn [acc n v]
                      (tset acc n v)
                      acc) (last args)
                    (fun.zip (fun.range 1 len) (fun.take (- len 1) args)))
        args)))

(fn keymap [mode key command]
  (vim.api.nvim_set_keymap mode key command {:silent true :noremap true}))

(fn buf_keymap [bufnr mode key command]
  (vim.api.nvim_buf_set_keymap bufnr mode key command
                               {:silent true :noremap true}))

(fn augroup [cmd table]
  (vim.api.nvim_create_augroup cmd table))

(fn autocmd [cmd table]
  (vim.api.nvim_create_autocmd cmd table))

(fn has [plugin]
  (not= (. (. (require :lazy.core.config) :plugins) plugin) nil))

(fn on-very-lazy [function]
  (autocmd :User {:pattern :VeryLazy :callback (fn [] (function))}))

(fn on-attach [on_attach]
  (autocmd :LspAttach {:callback (fn []
                                   (on_attach))}))

(fn setup [plugin config]
  (let [plugin (require plugin)]
    (plugin.setup config)))

(fn noremap [mode key command] (keymap mode key command))

(fn lnoremap [mode key command] (noremap mode (.. :<leader> key) command))

(fn shell-exec [shell]
  (let [process (io.popen shell)
        reader (process:read :*a)]
    (do
      (process:close nil)
      reader)))

(fn gitpush [] (shell-exec "~/.config/nvim/scripts/gitpush.sh"))

{: opt
 : colorscheme
 : g
 : keymap
 : buf_keymap
 : augroup
 : autocmd
 : fmt-autocmd
 : has
 : vis-op+
 : bkset
 : on-very-lazy
 : on-attach
 : tx
 : setup
 : noremap
 : lnoremap
 : shell-exec
 : gitpush}
