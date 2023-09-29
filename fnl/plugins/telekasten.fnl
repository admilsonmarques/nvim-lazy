(local home (vim.fn.expand "~/dev/ade/brain"))
; (local neorg (require :neorg))
; (local dirman (neorg.modules.get_module "core.dirman"))
; (local currentworkspace (dirman.get_current_workspace))

(local opts
  {: home
     ;if true telekasten will be enabled when opening a note within the configured home
     :take_over_my_home true
     :auto_set_filetype true
     ;; dir names for special notes (absolute path or subdir name)
     :dailies (.. home "/" :daily)
     :weeklies (.. home "/" :weekly)
     :templates (.. home "/" :templates)
     ;; image (sub)dir for pasting
     ;; dir name (absolute path or subdir name)
     ;; or nil if pasted images shouldn"t go into a special subdir
     :image_subdir :img
     ;; markdown file extension
     :extension :.norg
     ;; Generate note filenames. One of:
     ;; "title" (default) - Use title if supplied uuid otherwise
     ;; "uuid" - Use uuid
     ;; "uuid-title" - Prefix title by uuid
     ;; "title-uuid" - Suffix title with uuid
     :new_note_filename :uuid-title
     ;; file uuid type ("rand" or input for os.date()")
     :uuid_type "%Y%m%d%H%M"
     ;; UUID separator
     :uuid_sep "-"
     ;; following a link to a non-existing note will create it
     :follow_creates_nonexisting true
     :dailies_create_nonexisting true
     :weeklies_create_nonexisting true
     ;; skip telescope prompt for goto_today and goto_thisweek
     :journal_auto_open false
     ;; template for new notes (new_note follow_link)
     ;; set to `nil` or do not specify if you do not want a template
     :template_new_note (.. home "/" :templates/note.md)
     ;; template for newly created daily notes (goto_today)
     ;; set to `nil` or do not specify if you do not want a template
     :template_new_daily (.. home "/" :templates/daily.md)
     ;; template for newly created weekly notes (goto_thisweek)
     ;; set to `nil` or do not specify if you do not want a template
     :template_new_weekly (.. home "/" :templates/weekly.md)
     ;; image link style
     ;; wiki:     ![[image name]]
     ;; markdown: ![](image_subdir/xxxxx.png)
     :image_link_style :markdown
     ;; default sort option: "filename" "modified"
     :sort :modified
     ;; integrate with calendar-vim
     :plug_into_calendar true
     :calendar_opts {;; calendar week display mode: 1 .. "WK01" 2 .. "WK 1" 3 .. "KW01" 4 .. "KW 1" 5 .. "1"
                     :weeknm 4
                     ;; use monday as first day of week: 1 .. true 0 .. false
                     :calendar_monday 1
                     ;; calendar mark: where to put mark for marked days: "left" "right" "left-fit"
                     :calendar_mark :left-fit}
     ;; telescope actions behavior
     :close_after_yanking false
     :insert_after_inserting true
     ;; tag notation: "#tag" ":tag:" "yaml-bare"
     :tag_notation :yaml-bare
     ;; command palette theme: dropdown (window) or ivy (bottom panel)
     :command_palette_theme :dropdown
     ;; tag list theme:
     ;; get_cursor: small tag list at cursor; ivy and dropdown like above
     :show_tags_theme :ivy
     ;; when linking to a note in subdir/ create a [[subdir/title]] link
     ;; instead of a [[title only]] link
     :subdirs_in_links true
     ;; template_handling
     ;; What to do when creating a new note via `new_note()` or `follow_link()`
     ;; to a non-existing note
     ;; - prefer_new_note: use `new_note` template
     ;; - smart: if day or week is detected in title use daily / weekly templates (default)
     ;; - always_ask: always ask before creating a note
     :template_handling :smart
     ;; path handling:
     ;;   this applies to:
     ;;     - new_note()
     ;;     - new_templated_note()
     ;;     - follow_link() to non-existing note
     ;;
     ;;   it does NOT apply to:
     ;;     - goto_today()
     ;;     - goto_thisweek()
     ;;
     ;;   Valid options:
     ;;     - smart: put daily-looking notes in daily weekly-looking ones in weekly
     ;;              all other ones in home except for notes/with/subdirs/in/title.
     ;;              (default)
     ;;
     ;;     - prefer_home: put all notes in home except for goto_today() goto_thisweek()
     ;;                    except for notes with subdirs/in/title.
     ;;
     ;;     - same_as_current: put all new notes in the dir of the current note if
     ;;                        present or else in home
     ;;                        except for notes/with/subdirs/in/title.
     :new_note_location :smart
     ;; should all links be updated when a file is renamed
     :rename_update_links true
     :vaults {:vault2 {;; alternate configuration for vault2 here. Missing values are defaulted to
                       ;; default values from telekasten.
                       ;; e.g.
                       ;; home  "/home/user/vaults/personal"
                       }}
     ;; how to preview media files
     ;; "telescope-media-files" if you have telescope-media-files.nvim installed
     ;; "catimg-previewer" if you have catimg installed
     :media_previewer :viu-previewer
     ;; A customizable fallback handler for urls.
     :follow_url_fallback nil}
)

(local nkeys
  [
          {1 :<leader>tf
           2 "<cmd>:Telekasten find_notes<CR>"
           :desc "Find Notes"}
          {1 :<leader>td
           2 "<cmd>:Telekasten find_daily_notes<CR>"
           :desc "Find Daily Notes"}
          {1 :<leader>ts
           2 "<cmd>:Telekasten search_notes<CR>"
           :desc "Grep Notes"}
          {1 :<leader>tz
           2 "<cmd>:Telekasten follow_link<CR>"
           :desc "Follow Link"}
          {1 :<leader>tT
           2 "<cmd>:Telekasten goto_today<CR><CR>"
           :desc :Today}
          {1 :<leader>tW
           2 "<cmd>:Telekasten goto_thisweek<CR>"
           :desc "This Week"}
          {1 :<leader>tw
           2 "<cmd>:Telekasten find_weekly_notes<CR>"
           :desc "Find Weekly Notes"}
          {1 :<leader>tn
           2 "<cmd>:Telekasten new_templated_note<CR>"
           :desc "New Note"}
          {1 :<leader>tc
           2 "<cmd>:Telekasten show_calendar<CR>"
           :desc :Calendar}
          {1 :<leader>ti
           2 "<cmd>:Telekasten paste_img_and_link<CR>"
           :desc "Paste Img"}
          {1 :<leader>tl
           2 "<cmd>:Telekasten insert_link<CR>"
           :desc "Insert Link"}
          {1 :<leader>ty
           2 "<cmd>:Telekasten yank_notelink<CR>"
           :desc "Yank Note Link"}
          {1 :<leader>tb
           2 "<cmd>:Telekasten show_backlinks<CR>"
           :desc "Show Backlinks"}
          {1 :<leader>tF
           2 "<cmd>:Telekasten find_friends<CR>"
           :desc "Find friends"}
          {1 :<leader>tt
           2 "<cmd>:Telekasten toggle_todo<CR>"
           :desc "Toggle TODO"}
          {1 :<leader>tp
           2 "<cmd>:Telekasten preview_img<CR>"
           :desc "Preview Img"}
          {1 :<leader>t#
           2 "<cmd>:Telekasten show_tags<CR>"
           :desc "Show Tags"}
          {1 :<leader>tm
           2 "<cmd>:MarkdownPreviewToggle<CR>"
           :desc "Markdown Preview"}
          {1 :<leader>tr
           2 "<cmd>:Telekasten rename_note<CR>"
           :desc "Rename Note"}
      ])

(local ikeys
  [
         {1 :C-l 2 "<cmd>:Telekasten insert_link<CR>" :desc "Insert Link"}
         {1 :C-t 2 "<cmd>:Telekasten toggle_todo<CR>" :desc "Toggle TODO"}])


[{1 :renerocksai/telekasten.nvim
  :lazy false
  :keys nkeys
  :config (fn []
            (let [telekasten (require :telekasten)]
              (telekasten.setup opts)))}]
