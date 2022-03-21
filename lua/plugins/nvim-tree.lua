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
            hint = signs.hint,
            info = signs.info,
            warning = signs.warning,
            error = signs.error
        }
    },

    view = {
        mappings = {
            custom_only = false,
            list = {
                { key = "s", action = "vsplit" },
                { key = "t", action = "tabnew" },
            }
        }
    }
}

utils.nnoremap("<leader><Tab>", ":NvimTreeToggle<CR>")



