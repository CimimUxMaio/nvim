local utils = require("utils")

local status_ok, autopairs = pcall(require, "nvim-autopairs")
if not status_ok then
    utils.warn_module_import_fail("nvim-autopairs")
    return
end


local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
    utils.warn_module_import_fail("cmp (from autopairs)")
    return
end


cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })

autopairs.setup {}
