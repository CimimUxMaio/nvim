-- See `github.com/romgrk/barbar.nvim` for mor usefull commands.

local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap("n", "H", ":BufferPrevious<CR>", opts)
vim.api.nvim_set_keymap("n", "L", ":BufferNext<CR>", opts)
vim.api.nvim_set_keymap("n", "Q", ":BufferClose<CR>", opts)



-- Using default options
