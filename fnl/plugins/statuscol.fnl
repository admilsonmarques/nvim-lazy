(fn segments [builtin]
  [{:text [builtin.foldfunc] :click "v:lua.ScFa"}
   {:text [builtin.lnumfunc "│"]
    :condition [true builtin.not_empty]
    :click "v:lua.ScLa"}
   {:sign {:name [".*"] :colwidth 1 :maxwidth 2 :wrap true :auto true}
    :text ["%s"]
    :click "v:lua.ScSa"}])

(fn opts [builtin]
  {:foldfunc :builtin
   :setopt true
   :separator " "
   :relculright true
   :segments (segments builtin)
   :clickmod :c})

[{1 :luukvbaal/statuscol.nvim
  :config (fn []
            (let [statuscol (require :statuscol)
                  builtin (require :statuscol.builtin)]
              (statuscol.setup (opts builtin))))}]
