local utils = require("utils")

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
    utils.warn_module_import_fail("nvim-tree")
    return
end

vim.g.nvim_tree_icons = {
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


local signs = utils.Signs

-- Use all default plus some extras
nvim_tree.setup {
    diagnostics = {
        enable=true,
        icons = {
            hint = signs.HINT,
            info = signs.INFO,
            warning = signs.WARNING,
            error = signs.ERROR
        }
    },

    view = {
        mappings = {
            custom_only = false,
            list = {
                { key = "s", action = "vsplit" },
                { key = "hs", action = "split" },
                { key = "cd", action = "cd" }
            }
        }
    }
}

utils.nnoremap("<leader><Tab>", ":NvimTreeToggle<CR>", { silent = true })



