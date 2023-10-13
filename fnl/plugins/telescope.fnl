(local {: autoload} (require :nfnl.module))
(local core (autoload :nfnl.core))

(fn opts [themes]
  (let [grep-actions (require :telescope-live-grep-args.actions)]
    {:defaults {:file_ignore_patterns [:node_modules]}
     :extensions {:ui-select [(themes.get_dropdown)]
                  :live_grep_args {:auto_quoting true
                                   :mappings {:i {:<C-k> (grep-actions.quote_prompt)
                                                  :<C-i> (grep-actions.quote_prompt {:postfix " --iglob "})}}}}
     :pickers {:find_files {:find_command [:rg
                                           :--files
                                           :--iglob
                                           :!.git
                                           :--hidden]}}}))

(local nkeys ;find
       [{1 :<leader>fb
         2 "<cmd>Telescope git_branches theme=dropdown<cr>"
         :desc "Checkout branch"}
        {1 :<leader>fc
         2 "<cmd>Telescope colorscheme theme=dropdown<cr>"
         :desc :Colorscheme}
        {1 :<leader>ff
         2 "<cmd>Telescope find_files theme=dropdown<cr>"
         :desc "Find files"}
        {1 :<leader>ft
         2 "<cmd>Telescope live_grep theme=ivy<cr>"
         :desc "Find text"}
        {1 :<leader>fS
         2 "<cmd>Telescope grep_string theme=dropdown<cr>"
         :desc "Find String"}
        {1 :<leader>fh 2 "<cmd>Telescope help_tags<cr>" :desc :Help}
        {1 :<leader>fH 2 "<cmd>Telescope highlights<cr>" :desc :Highlights}
        {1 :<leader>fl 2 "<cmd>Telescope resume<cr>" :desc "Last Search"}
        {1 :<leader>fp 2 "<CMD>Telescope projects<CR>" :desc :Projects}
        {1 :<leader>fr
         2 "<cmd>Telescope oldfiles theme=dropdown<cr>"
         :desc "Recent File"}
        {1 :<leader>fR 2 "<cmd>Telescope registers<cr>" :desc :Registers}
        {1 :<leader>fk 2 "<cmd>Telescope keymaps<cr>" :desc :Keymaps}
        {1 :<leader>fC 2 "<cmd>Telescope commands<cr>" :desc :Commands}
        ; git
        {1 :<leader>go
         2 "<cmd>Telescope git_status theme=dropdown<cr>"
         :desc "Open changed file"}
        {1 :<leader>gb
         2 "<cmd>Telescope git_branches theme=dropdown<cr>"
         :desc "Checkout branch"}
        {1 :<leader>gc
         2 "<cmd>Telescope git_commits theme=dropdown<cr>"
         :desc "Checkout commit"}
        ; diag
        {1 :<leader>dD
         2 "<cmd>Telescope diagnostics theme=dropdown<cr>"
         :desc "Telescope diagnostics"}])

(local keys (core.merge nkeys {}))

[{1 :nvim-telescope/telescope-fzf-native.nvim
  :build "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"}
 {1 :nvim-telescope/telescope.nvim
  :branch :0.1.x
  :lazy false
  :dependencies [:nvim-lua/plenary.nvim
                 :nvim-telescope/telescope-ui-select.nvim
                 :nvim-telescope/telescope-file-browser.nvim
                 :nvim-telescope/telescope-live-grep-args.nvim
                 :nvim-lua/popup.nvim
                 :ahmedkhalf/project.nvim
                 :xiyaowong/telescope-emoji.nvim
                 :nvim-telescope/telescope-fzf-native.nvim
                 :nvim-telescope/telescope-symbols.nvim]
  : keys
  :config (fn []
            (let [telescope (require :telescope)
                  themes (require :telescope.themes)]
              (telescope.setup (opts themes))
              (telescope.load_extension :ui-select)
              (telescope.load_extension :emoji)
              (telescope.load_extension :projects)
              (telescope.load_extension :file_browser)
              (telescope.load_extension :live_grep_args)
              (telescope.load_extension :fzf)))}]
