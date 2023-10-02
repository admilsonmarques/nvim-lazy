-- [nfnl] Compiled from fnl/config/options.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local core = autoload("nfnl.core")
local icons = require("config.icons")
local _local_2_ = require("config.utils")
local g = _local_2_["g"]
local opt = _local_2_["opt"]
opt("wrap", false)
opt("spell", true)
opt("list", true)
g("loaded_netrw", 1)
g("loaded_netrwPlugin", 1)
local fillchars = ("foldopen:" .. core.get(icons.ui, "FolderOpen") .. ",foldclose:" .. core.get(icons.ui, "Folder") .. ",foldsep:" .. core.get(icons.ui, "LineDots") .. ",fold: ")
opt("foldcolumn", "1")
opt("foldlevel", 99)
opt("foldlevelstart", 99)
opt("foldenable", true)
opt("foldnestmax", 1)
local options = {completeopt = "menuone,noselect,preview", ignorecase = true, smartcase = true, clipboard = "unnamedplus", cmdheight = 2, conceallevel = 0, fileencoding = "utf-8", hlsearch = true, mouse = "a", pumheight = 10, showmode = true, showtabline = 2, smartindent = true, splitbelow = true, splitright = true, termguicolors = true, timeoutlen = 100, undofile = true, updatetime = 300, expandtab = true, shiftwidth = 2, tabstop = 2, cursorline = true, number = true, relativenumber = true, numberwidth = 4, signcolumn = "yes", scrolloff = 8, sidescrolloff = 8, guifont = "MesloLGF_NF:h17", fillchars = fillchars, swapfile = false, backup = false, wrap = false, writebackup = false}
for key, value in pairs(options) do
  opt(key, value)
end
return nil
