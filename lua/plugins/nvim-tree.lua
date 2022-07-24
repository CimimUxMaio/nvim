local utils = require("utils")

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
    utils.warn_module_import_fail("nvim-tree")
    return
end

-- vim.g.nvim_tree_icons = {
--     default = "",
--     symlink = "",
--     git = {
--         unstaged = "",
--         staged = "S",
--         unmerged = "",
--         renamed = "➜",
--         deleted = "",
--         untracked = "U",
--         ignored = "◌",
--     },
--     folder = {
--         default = "",
--         open = "",
--         empty = "",
--         empty_open = "",
--         symlink = "",
--     },
-- }


local signs = utils.icons.signs

-- Use all default plus some extras
nvim_tree.setup {
    update_cwd = true,
    diagnostics = {
        enable=true,
        icons = {
            hint = signs.Hint,
            info = signs.Info,
            warning = signs.Warn,
            error = signs.Error
        }
    },

    view = {
        mappings = {
            custom_only = false,
            list = {
                { key = {"vs", "s"}, action = "vsplit" },
                { key = "hs", action = "split" },
                { key = "cd", action = "cd" }
            }
        }
    },

    renderer = {
        icons = {
            glyphs = {
                default = "",
                symlink = "",
                git = {
                    unstaged = "",
                    staged = "S",
                    unmerged = "",
                    renamed = "➜",
                    deleted = "",
                    untracked = "U",
                    ignored = "◌",
                },
                folder = {
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                },
            }
        }
    }
}


vim.api.nvim_set_keymap("n", "<leader><Tab>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- Auto close NvimTree if it is the last buffer open at :q
vim.cmd [[
    autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
]]
