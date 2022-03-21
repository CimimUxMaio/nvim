local utils = require("utils")


-- Moving between tabs
utils.noremap("<S-l>", "gt")
utils.noremap("<S-h>", "gT")


utils.nnoremap("<C-c>", "<Esc>")



-- Moving between windows
utils.nnoremap("<C-j>", "<C-W><C-j>")
utils.nnoremap("<C-k>", "<C-W><C-k>")
utils.nnoremap("<C-l>", "<C-W><C-l>")
utils.nnoremap("<C-h>", "<C-W><C-h>")


-- Rezising windows
-- M: Alt
utils.nnoremap("<M-j>", ":resize -2<CR>")
utils.nnoremap("<M-k>", ":resize +2<CR>")
utils.nnoremap("<M-h>", ":vertical resize -2<CR>")
utils.nnoremap("<M-l>", ":vertical resize +2<CR>")


-- Better tabing
utils.vnoremap("<", "<gv")
utils.vnoremap(">", ">gv")
