require("utils")


-- Moving between tabs
noremap("<C-Right>", "gt")
noremap("<C-Left>", "gT")


nnoremap("<C-c>", "<Esc>")



-- Moving between windows
nnoremap("<C-j>", "<C-W><C-j>")
nnoremap("<C-k>", "<C-W><C-k>")
nnoremap("<C-l>", "<C-W><C-l>")
nnoremap("<C-h>", "<C-W><C-h>")


-- Rezising windows
-- M: Alt
nnoremap("<M-j>", ":resize -2<CR>")
nnoremap("<M-k>", ":resize +2<CR>")
nnoremap("<M-h>", ":vertical resize -2<CR>")
nnoremap("<M-l>", ":vertical resize +2<CR>")


-- Better tabing
vnoremap("<", "<gv")
vnoremap(">", ">gv")


-- Better autocompletion
--t = function(str)
--    return vim.api.nvim_replace_termcodes(str, true, true, true)
--end
--
--smart_tab = function()
--    if vim.fn.pumvisible() == 1 then
--        return t "<C-n>"
--    else
--        return t "<Tab>"
--    end
--end
--
--inoremap("<Tab>", "v:lua.smart_tab()", { expr = true })
