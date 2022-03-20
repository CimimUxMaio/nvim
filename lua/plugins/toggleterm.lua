require("utils")

local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
    warn_module_import_fail("toggleterm")
    return
end


toggleterm.setup({
    size = 10,
    open_mapping = "|",
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = "horizontal",
    close_on_exit = true,
    shell = vim.o.shell
})



function _G.set_terminal_keymaps()
    local opts = { noremap = true }
    --vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
    vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
    vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
    vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

local Terminal = require("toggleterm.terminal").Terminal


local float_opts = {
    border = "curved",
    winblend = 0,
    highlights = {
        border = "Normal",
        background = "Normal"
    }
}

local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction="float", float_opts=float_opts })
function _G.git()
    lazygit:toggle()
end

vim.cmd("command -nargs=0 LazyGit lua git()")



