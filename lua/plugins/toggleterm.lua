local utils = require("utils")

local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
    utils.warn_module_import_fail("toggleterm")
    return
end


toggleterm.setup({
    size = 15,
    -- open_mapping = "|",
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = false,
    persist_size = true,
    -- direction = "horizontal",
    close_on_exit = true,
    shell = vim.o.shell,
    float_opts = {
        border = "curved",
        winblend = 0,
        highlights = {
            border = "Normal",
            background = "Normal"
        }
    }

})


local keymap_opts = { noremap = true, silent = true }


function _G.set_terminal_movement_keymaps(bufnr)
    vim.api.nvim_buf_set_keymap(bufnr, "t", "<C-h>", [[<C-\><C-n><C-W>h]], keymap_opts)
    vim.api.nvim_buf_set_keymap(bufnr, "t", "<C-j>", [[<C-\><C-n><C-W>j]], keymap_opts)
    vim.api.nvim_buf_set_keymap(bufnr, "t", "<C-k>", [[<C-\><C-n><C-W>k]], keymap_opts)
    vim.api.nvim_buf_set_keymap(bufnr, "t", "<C-l>", [[<C-\><C-n><C-W>l]], keymap_opts)
end


function _G.set_terminal_disable_keymap(bufnr)
    vim.api.nvim_buf_set_keymap(bufnr, "t", "<esc>", [[<C-\><C-n>]], keymap_opts)
end


function _G.set_terminal_close_keymap(bufnr)
    vim.api.nvim_buf_set_keymap(bufnr, "t", "<M-t>", "<cmd>close<CR>", keymap_opts)
end



local Terminal = require("toggleterm.terminal").Terminal

local main_term = Terminal:new {
    hidden = true,
    direction = "horizontal",
    on_open = function(term)
        set_terminal_disable_keymap(term.bufnr)
        set_terminal_movement_keymaps(term.bufnr)
        set_terminal_close_keymap(term.bufnr)
    end
}

function _G.main_term_toggle()
    main_term:toggle()
end

vim.cmd("command -nargs=0 ToggleMainTerm lua main_term_toggle()")
vim.api.nvim_set_keymap("n", "|", ":ToggleMainTerm<CR>", keymap_opts)



local secondary_term = Terminal:new {
    hidden = true,
    direction = "float",
    on_open = function(term)
        set_terminal_disable_keymap(term.bufnr)
        set_terminal_close_keymap(term.bufnr)
    end
}

function _G.secondary_term_toggle()
    secondary_term:toggle()
end

vim.cmd("command -nargs=0 ToggleSecondaryTerm lua secondary_term_toggle()")
vim.api.nvim_set_keymap("n", "<M-t>", ":ToggleSecondaryTerm<CR>", keymap_opts)



local lazygit = Terminal:new {
    cmd = "lazygit",
    hidden = true,
    direction= "float",
}

function _G.lazygit_toggle()
    lazygit:toggle()
end

vim.cmd("command -nargs=0 LazyGit lua lazygit_toggle()")


-- vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
