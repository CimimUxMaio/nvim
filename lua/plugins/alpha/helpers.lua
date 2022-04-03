local utils = require "utils"

local icons_ok, icons = pcall(require, "nvim-web-devicons")
if not icons_ok then
    utils.warn_module_import_fail("nvim-web-devicons in alpha.lua")
    return
end

local sm_ok, sm_utils = pcall(require, "session_manager.utils")
if not sm_ok then
    utils.warn_module_import_fail("session_manager.utils in alpha.lua")
    return
end



local M = {}


function M.get_random_header()
    math.randomseed(os.time())
    return utils.Headers[math.random(#utils.Headers)]
end


function M.padding(val)
    return { type = "padding", val = val }
end


function M.make_layout(padding, items)
    local padded_layout = {}
    for i=1, 2 * #items, 2 do
        padded_layout[i] = M.padding(padding)
        padded_layout[i + 1] = items[math.floor(i / 2)]
    end
    return padded_layout
end


function M.create_button(icon, description, shortcut, keybind, hl_opts)
    local opts = {
        position = "center",
        shortcut = "[ " .. shortcut .. " ]",
        cursor = #icon + 1,
        width = 60,
        align_shortcut = "right",
        hl_shortcut = "Keyword",
        hl = hl_opts or {}
    }

    opts.keymap = { "n", shortcut, keybind, { noremap = true, silent = true } }

    local function on_press()
        local key = vim.api.nvim_replace_termcodes(shortcut .. "<ignore>", true, false, true)
        vim.api.nvim_feedkeys(key, "t", false)
    end

    return {
        type = "button",
        val = icon .. " " .. description,
        on_press = on_press,
        opts = opts
    }
end


function M.get_extension(file)
    local match = file:match("^.+(%..+)$")
    local ext = ""
    if match ~= nil then
        ext = match:sub(2)
    end
    return ext
end


function M.get_icon(file)
    return icons.get_icon(file, M.get_extension(file), { default = true })
end


function M.mru_files(limit, ignore_patterns)
    local oldfiles = vim.v.oldfiles or {}
    local cwd = vim.fn.getcwd()
    local function is_valid(f)
        return vim.fn.filereadable(f) and not utils.iany(ignore_patterns, function(p) return f:match(p) or false end)
    end
    local valid_files = utils.ifilter(oldfiles, is_valid)
    local mru = utils.take(valid_files, limit)
    return utils.imap(mru, function(f)
        local format = vim.startswith(f, cwd) and ":." or ":~"
        return vim.fn.fnamemodify(f, format)
    end)
end


function M.file_button(shortcut, file)
    local icon, icon_hl = M.get_icon(file)
    local hl_opts = {}
    if icon_hl then
        table.insert(hl_opts, { icon_hl, 0, #icon })
    end
    local file_name_start = file:match(".*/")
    if file_name_start ~= nil then
        table.insert(hl_opts, { "Comment", #icon + 1, #icon + #file_name_start + 1 })
    end
    return M.create_button(icon, file, shortcut, "<cmd>e " .. file .. " <CR>", hl_opts)
end


function M.session_list()
    return utils.imap(sm_utils.get_sessions(), function(s)
        return s["filename"]
    end)
end


function M.session_button(shortcut, session_filename)
    local session_dirname = tostring(sm_utils.session_filename_to_dir(session_filename))
    local session_description = vim.fn.fnamemodify(session_dirname, ":t:r")
    return M.create_button(
        "ﮛ",
        session_description, shortcut,
        "<cmd>:cd " .. session_dirname .. " | lua require('session_manager.utils').load_session('" .. session_filename .. "', false)<CR>"
    )
end


function M.title(text)
    return {
        type = "text",
        val = text,
        opts = {
            position = "center",
            hl = "Title"
        }
    }
end


function M.titled_group(icon, title, items)
    local full_title = icon .. " " .. title
    return {
        type = "group",
        val = {
            M.title(full_title),
            M.padding(1),
            { type = "group", val = items }
        }
    }
end


function M.create_project(how)
    return function()
        vim.ui.input({prompt = "Enter new project's name: "}, function(name)
            how(name)
            vim.cmd("cd " .. name)
            vim.notify("Project created")
        end)
    end
end



ProjectBuilders = {
    haskell_stack = M.create_project(function(name)
        vim.cmd("!stack new " .. name)
    end)
}


function M.create_project_button(icon, shortcut, builder_name)
    return M.create_button(
        icon,
        "Start new " .. builder_name .. " project",
        shortcut,
        "<cmd>:lua ProjectBuilders['" .. builder_name .. "']()<cr>"
    )
end


return M



