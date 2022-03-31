local utils = require "utils"
local helpers = require "plugins.alpha.helpers"


local alpha_ok, alpha = pcall(require, "alpha")
if not alpha_ok then
    utils.warn_module_import_fail("alpha")
    return
end


local header = {
    type = "text",
    val = helpers.get_random_header(),
    opts = {
        position = "center",
        hl = "Type",
    },
}


local footer = {
    type = "text",
    val = "",
    opts = {
        position = "center",
        hl = "Number"
    }
}



local function mru(start, limit)
    local file_buttons = function()
        local files = helpers.mru_files(limit, { "NvimTree_" })
        return utils.map(files, function(f, i)
            return helpers.file_button(tostring(start + i), f)
        end)
    end

    return {
        type = "group",
        val = {
            { type = "text", val = "MRU", opts = { position = "center", hl = "SpecialComments" } },
            helpers.padding(1),
            { type = "group", val = file_buttons }
        },
    }
end



local config = {}


config.layout = {
    helpers.padding(2),
    header,
    helpers.padding(2),
    mru(0, 5),
    footer
}


config.opts = {
    margin = 3,
    redraw_on_resize = false,
    setup = function()
        vim.cmd("autocmd alpha_temp DirChanged * lua require('alpha').redraw()")
    end
}


alpha.setup(config)
