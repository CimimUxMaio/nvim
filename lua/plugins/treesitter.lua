local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    warn_module_import_fail("nvim-treesitter.configs")
    return
end


configs.setup {
    ensure_installed = "maintained",
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
    }
}