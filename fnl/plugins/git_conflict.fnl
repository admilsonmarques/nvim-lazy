(local  opts
  {; disable buffer local mapping created by this plugin
   :default_mappings true
   ; disable commands created by this plugin
   :default_commands true
   ; This will disable the diagnostics in a buffer whilst it is conflicted
   :disable_diagnostics false
   ; They must have background color, otherwise the default color will be used
   :highlights {:incoming :DiffText :current :DiffAdd}})

[{1 :akinsho/git-conflict.nvim
  : opts }]
