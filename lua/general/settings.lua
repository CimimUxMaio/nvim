require("utils")


local set = vim.opt
local global = vim.g


set.mouse = "a"
set.encoding = "UTF-8"
set.foldmethod = "indent"
set.foldlevel = 99
set.number = true
set.cursorline = true
set.shiftwidth = 4
set.tabstop = 4
set.expandtab = true
set.backup = false
set.wrap = false
set.incsearch = true
set.ignorecase = true
set.smartcase = true
set.showcmd = true
set.showmode = true
set.showmatch = true
set.history = 1000
set.wildmenu = true
set.wildmode = {"list", "longest"}
set.wildignore = {"*.docx", "*.jpg","*.png","*.gif", "*.pdf", "*.pyc", "*.exe", "*.flv", "*.img", "*.xlsx"}
set.clipboard = "unnamedplus"
set.termguicolors = true


set.updatetime = 500  -- Refresh rate
set.syntax = "on"



global.mapleader = "¡"
