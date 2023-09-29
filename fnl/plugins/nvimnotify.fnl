(local opts
  {:timeout 3000
   :render :wrapped-compact
   :max_height 40
   :max_width 60
   })

[{1 :rcarriga/nvim-notify
  ; :keys {1 :<leader>un
  ;        2 (fn []
  ;            (let [notify (require :notify)]
  ;              (notify.dismiss {:silent true
  ;                               :pending true})))
  ;        :desc "Dismiss all Notifications"}

  :config (fn []
            (let [notify (require :notify)]
              (notify.setup opts)))}]
