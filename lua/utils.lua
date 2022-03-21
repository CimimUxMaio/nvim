
local M = {}


local Mode = { NORMAL = "n", INSERT = "i", VISUAL = "v", ALL = "" }

local _base_noremap = function(mode, lhs, rhs, opts)
    local options = opts or {}
    options.noremap = true
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end


local _base_map = function(mode, lhs, rhs, opts)
    local options = opts or {}
    options.noremap = false
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end


function M.noremap(lhs, rhs, opts)
    _base_noremap(Mode.ALL, lhs, rhs, opts)
end

function M.map(lhs, rhs, opts)
    _base_map(Mode.ALL, lhs, rhs, opts)
end


function M.nnoremap(lhs, rhs, opts)
    _base_noremap(Mode.NORMAL, lhs, rhs, opts)
end

function M.nmap(lhs, rhs, opts)
    _base_map(Mode.NORMAL, lhs, rhs, opts)
end


function M.inoremap(lhs, rhs, opts)
    _base_noremap(Mode.INSERT, lhs, rhs, opts)
end

function M.imap(lhs, rhs, opts)
    _base_map(Mode.INSERT, lhs, rhs, opts)
end


function M.vnoremap(lhs, rhs, opts)
    _base_noremap(Mode.VISUAL, lhs, rhs, opts)
end

function M.vmap(lhs, rhs, opts)
    _base_map(Mode.VISUAL, lhs, rhs, opts)
end


----------------

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
