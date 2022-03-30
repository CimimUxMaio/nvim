local utils = require "utils"
local math = require "math"
local ok, alpha = pcall(require, "alpha")

if not ok then
    utils.warn_module_import_fail("alpha")
end


math.randomseed(os.time())

local header = {
    type = "text",
    -- val = {
    --     [[                               __                ]],
    --     [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
    --     [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
    --     [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
    --     [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
    --     [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
    -- },
    val = utils.Headers[math.random(#utils.Headers)],
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


local padding = { type = "padding", val = 2 }



local function create_button(icon, description, shortcut, keybind)
    local opts = {
        position = "center",
        shortcut = "[ " .. shortcut .. " ]",
        -- hl = "CursorLine",
        cursor = 0,
        width = 50,
        align_shortcut = "right",
        hl_shortcut = "Keyword"
    }

    opts.keymap = { "n", shortcut, keybind, { noremap = true, silent = true } }

    local function on_press()
        local key = vim.api.nvim_replace_termcodes(shortcut .. "<Ignore>", true, false, true)
        vim.api.nvim_feedkeys(key, "t", false)
    end

    return {
        type = "button",
        val = icon .. " " .. description,
        on_press = on_press,
        opts = opts
    }
end


local buttons = {
    create_button("", "Say hello", "msg", "<CMD>lua vim.notify('Hello')<CR>"),
    create_button("", "Say bye", "bye", "<CMD>lua vim.notify('Bye')<CR>"),
}


local config = {}

config.layout = {
    padding,
    header,
    padding,
    {
        type = "group",
        val = buttons,
        opts = { spacing = 1 }
    },
    footer
}


config.opts = { margin = 5 }


alpha.setup(config)



