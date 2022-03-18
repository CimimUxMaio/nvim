general = vim.o
window = vim.wo
buffer = vim.bo
global = vim.g
set = vim.opt


Mode = { NORMAL = "n", INSERT = "i", VISUAL = "v", ALL = "" }



local _base_noremap = function(mode, lhs, rhs, opts)
    options = opts or {}
    options.noremap = true
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end


local _base_map = function(mode, lhs, rhs, opts)
    options = opts or {}
    options.noremap = false
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end


function noremap(lhs, rhs, opts)
    _base_noremap(Mode.ALL, lhs, rhs, opts)
end

function map(lhs, rhs, opts)
    _base_map(Mode.ALL, lhs, rhs, opts)
end


function nnoremap(lhs, rhs, opts)
    _base_noremap(Mode.NORMAL, lhs, rhs, opts)
end

function nmap(lhs, rhs, opts)
    _base_map(Mode.NORMAL, lhs, rhs, opts)
end


function inoremap(lhs, rhs, opts)
    _base_noremap(Mode.INSERT, lhs, rhs, opts)
end

function imap(lhs, rhs, opts)
    _base_map(Mode.INSERT, lhs, rhs, opts)
end


function vnoremap(lhs, rhs, opts)
    _base_noremap(Mode.VISUAL, lhs, rhs, opts)
end

function vmap(lhs, rhs)
    _base_map(Mode.VISUAL, lhs, rhs, false)
end

