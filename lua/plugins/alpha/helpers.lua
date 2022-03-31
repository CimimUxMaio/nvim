local utils = require "utils"

local icons_ok, icons = pcall(require, "nvim-web-devicons")
if not icons_ok then
    utils.warn_module_import_fail("nvim-web-devicons in alpha.lua")
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


function M.create_button(icon, description, shortcut, keybind, hl_opts)
    local opts = {
        position = "center",
        shortcut = "[ " .. shortcut .. " ]",
        -- hl = "CursorLine",
        cursor = 0,
        width = 80,
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
        return vim.fn.filereadable(f) and not utils.any(ignore_patterns, function(p) return f:match(p) or false end)
    end
    local valid_files = utils.filter(oldfiles, is_valid)
    local mru = utils.take(valid_files, limit)
    return utils.map(mru, function(f)
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


return M



