local utils = require("utils")

local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    utils.warn_module_import_fail("nvim-treesitter.configs")
    return
end


configs.setup {
    ensure_installed = "all",
    sync_install = false,
    ignore_install = { "" },
    highlight = {
        enable = true,
        disable = {},
        aditional_vim_regex_highlighting = true
    },

    indent = { enable = true, disable = {} },

    context_commentstring = {
        enable = true
    },

    autotag = {
        enable = true
    },

    refactor = {
        smart_rename = {
            enable = true,
            keymaps = {
                smart_rename = "<leader>r"
            }
        }
    }
}
