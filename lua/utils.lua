
local M = {}

function M.warn_module_import_fail(name)
    vim.notify("Module " .. name .. " failed to load", "warn")
end


----------------

M.Signs = {
    HINT = "",
    INFO = "",
    WARNING = "",
    ERROR = "",
    DEBUG = "",
    TRACE = "✎"
}


return M
