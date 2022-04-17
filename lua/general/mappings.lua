
local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap("n", "<C-c>", "<Esc>", opts)
vim.api.nvim_set_keymap("i", "<C-c>", "<Esc>", opts)



-- Moving between windows
vim.api.nvim_set_keymap("n", "<C-j>", "<C-W><C-j>", opts)
vim.api.nvim_set_keymap("n", "<C-k>", "<C-W><C-k>", opts)
vim.api.nvim_set_keymap("n", "<C-l>", "<C-W><C-l>", opts)
vim.api.nvim_set_keymap("n", "<C-h>", "<C-W><C-h>", opts)


-- Rezising windows
-- M: Alt
vim.api.nvim_set_keymap("n", "<M-j>", ":resize -2<CR>", opts)
vim.api.nvim_set_keymap("n", "<M-k>", ":resize +2<CR>", opts)
vim.api.nvim_set_keymap("n", "<M-h>", ":vertical resize -2<CR>", opts)
vim.api.nvim_set_keymap("n", "<M-l>", ":vertical resize +2<CR>", opts)


-- Better tabing
vim.api.nvim_set_keymap("v", "<", "<gv", opts)
vim.api.nvim_set_keymap("v", ">", ">gv", opts)
