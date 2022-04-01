local utils = require("utils")

local ok_path, Path = pcall(require, "plenary.path")
if not ok_path then
    utils.warn_module_import_fail("plenary.path in session_manager.lua")
    return
end

local ok_manager, manager = pcall(require, "session_manager")
if not ok_manager then
    utils.warn_module_import_fail("session_manager")
    return
end

local manager_config = require("session_manager.config")

manager.setup({
    sessions_dir = Path:new(vim.fn.stdpath("data"), "sessions"),
    path_replacer = "__",
    colon_replacer = "++",
    autoload_mode = manager_config.AutoloadMode.Disabled,
    autosave_last_session = true,
    autosave_ignore_not_normal = true,
    autosave_ignore_filetypes = {
        "gitcommit",
    },
    autosave_only_in_session = false,
    max_path_length = 80
})
