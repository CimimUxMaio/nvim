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
        local ignore_patterns = {
            "^NvimTree_.*",
            "^term://.*"
        }
        local files = helpers.mru_files(limit, ignore_patterns)
        return utils.imap(files, function(f, i)
            return helpers.file_button(tostring(start + i), f)
        end)
    end

    return helpers.titled_group("", "Frecuency / MRU", file_buttons)
end


local function session_manager(limit)
    local sessions = utils.take(helpers.session_list(), limit)
    local session_buttons = utils.imap(sessions, function(s, i)
        return helpers.session_button("s" .. tostring(i), s)
    end)

    return helpers.titled_group("", "Session Manager", session_buttons)
end


local language_icons = utils.icons.languages

local general_group = helpers.titled_group("亮", "General", {
    helpers.create_project_button(language_icons.haskell, "hs", "haskell_stack"),
})


local config = {}

config.layout = helpers.make_layout(1, {
    header,
    general_group,
    session_manager(3),
    mru(0, 5),
    footer
})


config.opts = {
    margin = 3,
    redraw_on_resize = false,
    setup = function()
        vim.cmd("autocmd alpha_temp DirChanged * lua require('alpha').redraw()")
    end
}


alpha.setup(config)
