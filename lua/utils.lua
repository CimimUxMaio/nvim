
local M = {}

function M.warn_module_import_fail(name)
    vim.notify("Module " .. name .. " failed to load", "warn")
end

----------------

function M.take(array, n)
    return table.move(array, 1, n, 1, {})
end



local function _base_map(get_pairs, array, func)
    local new_array = {}
    for k, v in get_pairs(array) do
        new_array[k] = func(v, k)
    end

    return new_array
end

function M.map(array, func)
    return _base_map(pairs, array, func)
end

function M.imap(array, func)
    return _base_map(ipairs, array, func)
end


local function _base_any(get_pairs, array, condition)
    local result = false
    for _, v in get_pairs(array) do
        result = condition(v)
        if result then break end
    end
    return result
end

function M.any(array, func)
    return _base_any(pairs, array, func)
end

function M.iany(array, func)
    return _base_any(ipairs, array, func)
end


local function _base_filter(get_pairs, array, condition)
    local new_array = {}
    for k, v in get_pairs(array) do
        if condition(v) then
            new_array[k] = v
        end
    end

    return new_array
end

function M.filter(array, func)
    return _base_filter(pairs, array, func)
end

function M.ifilter(array, func)
    return _base_filter(ipairs, array, func)
end


function M.max_by(array, ponderation)
    local max = nil
    for _, item in ipairs(array) do
        max = (max == nil or ponderation(item) > ponderation(max)) and item or max
    end
    return max
end

----------------

M.icons = {
    signs = {
        Hint = "",
        Info = "",
        Warn = "",
        Error = "",
        Debug = "",
        Trace = "✎"
    },
    kinds = {
        Text = "",
        Method = "m",
        Function = "",
        Constructor = "",
        Field = "",
        Variable = "",
        Class = "",
        Interface = "",
        Module = "",
        Property = "",
        Unit = "",
        Value = "",
        Enum = "",
        Keyword = "",
        Snippet = "",
        Color = "",
        File = "",
        Reference = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = "",
        Event = "",
        Operator = "",
        TypeParameter = "",
    },
    languages = {
        haskell = ""
    }
}


----------------

M.Headers = {
    {
        [[⠀⢀⡌⣚⣭⣾⡿⡷⡷⠷⢻⢻⠣⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
        [[⡨⣻⣿⡿⣛⡭⡖⡕⢕⠉⠀⠀⠀⠀⡈⢤⣚⣝⣝⢭⢪⡄⢈⠀⠀]],
        [[⣽⣿⢿⢶⣭⣾⡿⣷⣯⣞⡊⠈⣀⣖⣾⣿⡷⠳⠳⡳⡷⣿⣮⢭⢌]],
        [[⣿⣿⠐⣿⡿⢭⣚⢪⣚⣻⣿⡽⢇⣿⡿⣙⣾⣿⣿⣯⣞⣚⣻⣿⢾]],
        [[⣿⣿⢈⣿⣯⢺⢻⣻⣿⣴⣿⠏⣰⣿⡏⣿⣟⣬⣮⠖⣿⣯⢡⣿⣿]],
        [[⢽⣿⣯⣛⠳⡷⡷⢷⣋⣿⢿⠼⣃⣷⣿⢝⠳⢻⡥⢏⣿⠿⣼⣰⣿]],
        [[⠐⡒⣻⣷⣿⣿⣿⣿⢷⡛⡖⡄⡄⡥⢽⡷⣿⣮⣿⡷⡛⠲⡏⣿⣿]],
        [[⠀⣰⣰⣯⣢⠂⢢⣮⣭⣾⡿⡷⡷⣿⣮⢽⢦⠢⠢⠑⢀⢴⣽⡿⡫]],
        [[⠀⣰⣰⣿⣰⠀⠞⣾⣿⣥⣒⣾⣿⣮⠽⣿⣯⡫⠈⡬⣫⡿⣿⠶⠁]],
        [[⠀⠐⠼⣿⣏⣇⢇⣷⣿⡺⣴⡷⢧⣿⣿⣲⣿⠏⠟⢳⡕⠒⠀⠀⠀]],
        [[⠀⠀⠰⢽⣿⣯⢽⣗⡻⣿⣯⣮⣿⣷⢧⣼⣿⣇⠃⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠐⡒⡻⣿⣯⣞⣍⢞⣝⣌⣮⣿⢷⡭⠁⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠐⠠⠑⠳⠳⠳⠳⠳⠓⠡⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
    },
    {
        [[  ⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⠏⠀⠀⠀⠀⠀⠀⠀⠀    ]],
        [[  ⠀⠀⠀⠀⠀⠀⠀⠀⣾⣷⣿⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀  ]],
        [[  ⠀⠀⡠⡮⢌⠀⠀⣰⣿⣾⣻⣯⠈⠀⠀⠀⠀⠀⠀⠀⠀  ]],
        [[  ⠀⠀⠀⣳⣿⣯⢌⠰⣿⡽⣯⠽⣷⣮⠌⠀⠀⠀⠀⠀⠀  ]],
        [[  ⠀⠀⠀⣸⣿⣾⣷⣎⣱⣿⠹⣿⢎⡱⣿⠌⠀⢈⣌⢌⠀  ]],
        [[  ⠀⠀⣀⣿⠇⣿⠼⣿⣼⡿⠀⣰⣿⠀⣿⣏⣾⣷⣿⠃⠀  ]],
        [[  ⠀⣨⣿⠓⣨⣿⣀⣟⢷⣉⣌⣿⣏⣨⣿⡿⣽⣳⣿⠀⠀  ]],
        [[  ⣠⣿⠇⣠⣿⣃⣿⣃⣿⢗⣌⣜⢽⣷⣿⣯⣿⠰⣿⢎⠀  ]],
        [[  ⣰⣿⠀⣰⣿⣰⣿⣰⣿⣷⣟⠝⣿⠟⣿⠏⣿⠏⠰⣿⠎  ]],
        [[  ⠐⣷⣏⡸⣿⠌⣷⣏⡻⣯⣎⣮⠷⣉⣿⠃⣿⠏⣨⣿⠃  ]],
        [[  ⠀⠀⠱⡷⡷⣿⢌⠹⡷⣯⣮⣮⡶⠳⢉⣼⡿⡶⠷⠁⠀  ]],
        [[  ⠀⠀⠀⠀⠀⠐⠱⡷⣷⣮⣮⣮⣮⡷⠳⠑⠀⠀⠀⠀⠀  ]],
    },
    {
        [[⠀⠀⠀⠀⢀⠀⣈⣭⣮⣿⣿⣿⡷⡷⡷⣿⣿⣮⣞⢌⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⢀⣭⣿⡿⠷⢳⢻⠳⡷⣿⣮⢭⢊⣌⣝⣻⣿⣿⣞⡊⠈⠀]],
        [[⠀⢠⣭⡿⢻⢩⠘⠀⠀⠀⢨⢺⢊⠵⣿⣿⣛⢽⣷⣿⣿⣻⣿⢎⢀]],
        [[⢔⣾⣿⣿⡷⡷⣷⣿⣮⣿⠷⠳⡳⣯⣸⣿⣽⣷⣾⣻⣿⣩⣹⣿⠎]],
        [[⣼⣿⣓⢢⣘⣝⢩⣒⣳⣿⣸⣿⢟⣿⣧⣿⡷⣿⣿⣿⣯⣮⣮⣿⣿]],
        [[⣿⠏⣬⡿⠛⢹⡻⣯⠐⣿⣯⣝⣟⣯⣿⣿⣿⡷⢻⢻⠑⡕⡕⣳⣿]],
        [[⣿⠏⣷⣏⡰⣿⣯⡿⣸⣿⣗⠻⣻⣽⡿⠓⠩⢉⣭⣮⣿⣿⣿⣿⣿]],
        [[⣿⣯⢘⡷⣯⣌⣬⣾⡷⢣⣛⣾⡿⡛⡚⣚⣾⡿⠻⢕⡠⠀⢪⣺⣿]],
        [[⣳⣿⣿⣿⣮⣮⣮⣮⣿⡷⠳⠑⢔⣚⣾⡿⡛⢒⣈⣮⣿⡿⣷⣿⠿]],
        [[⠒⣷⣯⣌⢙⢙⢙⢉⢪⣚⣍⣮⡿⠷⢕⢤⣭⣿⡷⡓⢡⣂⣿⡿⠩]],
        [[⠀⠑⡻⣿⣿⡿⡷⡷⡷⠷⢻⠕⡂⣈⣬⣿⢷⢥⡀⢨⣭⣿⢷⠀⠀]],
        [[⠀⠀⠀⠒⠳⣷⣿⣮⣮⣮⣮⣾⣿⣿⢻⣉⣍⣮⣿⡿⠳⠡⠁⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠂⠑⠱⠳⠳⠳⠳⠳⠳⠳⠳⠑⠡⠀⠀⠀⠀⠀⠀]],
    },
    {
        [[⠀⠀⠀⠀⠀⢀⣬⣿⣿⡷⡷⡷⡷⡷⡷⡷⣿⣿⣎⠀⠀⠀⠀⠀ ]],
        [[⠀⠀⠀⠀⠀⣾⣿⠓⠂⠀⢀⣈⣝⣝⢌⠈⠠⡱⣿⠎⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⣰⣿⠟⢄⣌⣾⡿⡷⡷⡷⣷⣿⣎⣂⣳⣿⠌⠀⠀⠀⠀]],
        [[⠀⠀⠀⢂⣿⡿⣐⣾⣿⠓⢂⣘⣍⣌⣌⠽⣿⣏⠒⣿⣯⠀⠀⠀⠀]],
        [[⠀⠀⠀⣾⣿⠁⣼⣿⠏⣂⣿⠓⠅⠐⣱⣿⣹⣿⠰⡸⣿⣏⠀⠀⠀]],
        [[⠀⠀⣼⣿⠇⠂⣰⣿⠏⠼⣿⢼⡳⡦⡷⣃⣿⡿⠐⠀⣱⣿⠎⠀⠀]],
        [[⠀⣠⣿⠿⠀⠀⠀⡳⣿⣞⠺⡷⣿⣿⣿⡷⠳⠁⠀⠀⠐⣿⣿⠌⠀]],
        [[⢂⣿⣿⠁⠀⠀⠀⠀⠐⡳⣷⣿⣮⣮⡦⠳⠀⠀⠀⠀⠠⣰⣿⣯⢀]],
        [[⣼⣿⠏⢨⢪⢊⢈⢈⣈⣌⣍⣌⠊⢀⢈⣌⣌⣌⣌⣌⣌⠌⣿⣿⠎]],
        [[⣿⣿⠀⡷⡷⡷⡷⡷⡷⡷⣷⣿⣏⣿⣿⠳⠳⠳⢻⢻⢻⢫⣰⣿⣿]],
        [[⣿⠟⣠⣮⣮⣮⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⡷⡷⡷⠗⣿⣿]],
        [[⣿⣯⢈⢨⢪⢪⢪⢪⣈⣌⣬⣿⡿⣿⣿⣌⣌⣌⣌⣝⣝⣝⣍⣿⣿]],
        [[⠳⠳⠳⠳⠳⠳⠳⠳⠳⠳⠳⠳⠃⠱⠳⠳⠳⠳⠳⠳⠳⠳⠳⠳⠁]],
    }
}

return M

