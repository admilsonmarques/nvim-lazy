(local {: autoload} (require :nfnl.module))
(local core (autoload :nfnl.core))
(local icons (require :config.icons))
(local {: g
        : opt} (require :config.utils))


;don't wrap lines
(opt :wrap false)
(opt :spell true)
(opt :list true)

;remove itens for nvim-tree config
(g :loaded_netrw 1)
(g :loaded_netrwPlugin 1)

(local fillchars
  (.. "foldopen:" (core.get icons.ui :FolderOpen) ",foldclose:"
         (core.get icons.ui :Folder) ",foldsep:" (core.get icons.ui :LineDots)
         ",fold: "))

(opt :foldcolumn :1)
(opt :foldlevel 99)
(opt :foldlevelstart 99)
(opt :foldenable true)
(opt :foldnestmax 1)

;sets a nvim global options


(local options {;settings needed for compe autocompletion
               :completeopt "menuone,noselect,preview"
               ;case insensitive search
               :ignorecase true
               ;smart search case
               :smartcase true
               ;shared clipboard with linux
               ;allows neovim to access the system clipboard
               :clipboard :unnamedplus
               ;creates a backup file
               :backup false
               ;more space in the neovim command line for displaying messages
               :cmdheight 2
               ;so that `` is visible in markdown files
               :conceallevel 0
               ;the encoding written to a file
               :fileencoding :utf-8
               ;highlight all matches on previous search pattern
               :hlsearch true
               ;allow the mouse to be used in neovim
               :mouse :a
               ;pop up menu height
               :pumheight 10
               ;we don't need to see things like -- INSERT -- anymore
               :showmode true
               ;always show tabs
               :showtabline 2
               ;make indenting smarter again
               :smartindent true
               ;force all horizontal splits to go below current window
               :splitbelow true
               ;force all vertical splits to go to the right of current window
               :splitright true
               ;creates a swapfile
               :swapfile false
               ;set term gui colors (most terminals support this)
               :termguicolors true
               ;time to wait for a mapped sequence to complete (in milliseconds)
               :timeoutlen 100
               ;enable persistent undo
               :undofile true
               ;faster completion (4000ms default)
               :updatetime 300
               ;if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
               :writebackup false
               ;convert tabs to spaces
               :expandtab true
               ;the number of spaces inserted for each indentation
               :shiftwidth 2
               ;insert 2 spaces for a tab
               :tabstop 2
               ;highlight the current line
               :cursorline true
               ;set numbered lines
               :number true
               ;set relative numbered lines
               :relativenumber true
               ;set number column width to 2 {default 4}
               :numberwidth 4
               ;always show the sign column, otherwise it would shift the text each time
               :signcolumn :yes
               ;display lines as one long line
               :wrap false
               ;is one of my fav
               :scrolloff 8
               :sidescrolloff 8
               ;the font used in graphical neovim applications
               :guifont "MesloLGF_NF:h17"
               : fillchars})

  (each [key value (pairs options)]
  (opt key value))
