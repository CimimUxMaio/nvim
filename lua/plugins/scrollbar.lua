local utils = require("utils")

local status_ok, scrollbar = pcall(require, "scrollbar")
if not status_ok then
    utils.warn_module_import_fail("scrollbar")
    return
end


scrollbar.setup({
    handle = {
        color = "#BBBBBB"
    }
})


local hlslens_ok, _ = pcall(require, "hlslens")
if hlslens_ok then
    require("scrollbar.handlers.search").setup()
end
